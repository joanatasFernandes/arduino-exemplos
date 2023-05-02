#include <ArduinoJson.h>
#include <ArduinoWebsockets.h>
#include <ESP8266WiFi.h>

const char *ssid = "Rede wifi";
const char *password = "Senha do wifi";

using namespace websockets;

WebsocketsClient client;

int LED = LED_BUILTIN;
unsigned long previousMillis = 0;
const long INTERVAL = 6000;

int sensor = 0;  // Pino input ligado ao sensor PIR
int pinoLuz = 1; // Pino output para ligar a luz

bool lastState = false;

void apagar() {
    lastState = false;
    digitalWrite(LED, 1);
    digitalWrite(pinoLuz, 1);
}

void acender() {
    lastState = true;
    digitalWrite(LED, 0);
    digitalWrite(pinoLuz, 0);
}

void connectToServer() {

    bool connected = client.connect("wss://app-workspace.com/arduino-websocket/api/v1/lights");

    if (connected) {
        Serial.println("Connected to server");
        if(lastState) {
          sendMenssage("ON", false);
          acender();
        } else {
          sendMenssage("OFF", true);
          apagar();
        }
        return;
    } else {
        Serial.println("Connection failed");
    }
    digitalWrite(LED, 1);
    delay(250);
}


void sendMenssage(String status, bool fistMessage) {
  // Cria um objeto JSON
  StaticJsonDocument<128> json;
  json["lightId"] = "dafff6d2-5253-43d4-9e3e-49bf998c4e86";
  json["lightName"] = "Sala de jantar";
  json["status"] = status;
  json["fistMessage"] = fistMessage;

  // Serializa o objeto JSON em uma string
  String jsonString;
  serializeJson(json, jsonString);
  client.send(jsonString);
}

void setup() {
    Serial.begin(115200);

    pinMode(sensor, INPUT);
    pinMode(pinoLuz, OUTPUT);
    pinMode(LED, OUTPUT);

    // Connect to wifi
    WiFi.begin(ssid, password);

    // Wait some time to connect to wifi
    while (WiFi.status() != WL_CONNECTED) {
        digitalWrite(LED, 0);
        delay(1000);
        digitalWrite(LED, 1);
        Serial.println("Connecting to WiFi...");
    }

    Serial.println("Connected to Wifi");

    // Connect to Websockets server
    connectToServer();

    // Run callback when messages are received
    client.onMessage([&](WebsocketsMessage message) {

        StaticJsonDocument<128> json;
        DeserializationError error = deserializeJson(json, message.data());

        // Verifica se houve erros na conversão do JSON
        if (error) {
            Serial.print("Error deserializing JSON: ");
            Serial.println(error.c_str());
        } else {
            // Processa a mensagem recebida em formato JSON
            if (json["status"] == "ON") {
                acender();
            } else {
                apagar();
            }
            sendMenssage(json["status"], false);
        }
    });
}

void loop() {
    // Verifica se há mensagens recebidas do
    if (client.available()) {
        client.poll();
    } else {
        digitalWrite(LED, 0);
        delay(500);
        connectToServer();
    }
    delay(250);
}
