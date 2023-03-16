#include <ArduinoJson.h>
#include <ArduinoWebsockets.h>
#include <ESP8266WiFi.h>

const char *ssid = "Rede wifi";
const char *password = "Senha do wifi";
const char *websockets_server_host = "Ip da máquina onde está rodando o back end";
const uint16_t websockets_server_port = 8080;

using namespace websockets;

WebsocketsClient client;

int LED = LED_BUILTIN;
unsigned long previousMillis = 0;
const long INTERVAL = 6000;

int sensor = 0;  // Pino input ligado ao sensor PIR
int pinoLuz = 1; // Pino output para ligar a luz

int mensagemMonitoramentoEnviada = 0;
int estadoDasLuzes = 1;
int apagamentoManual = 0;
int acendimentoManul = 0;

int contador = 0;

void apagar() {
    digitalWrite(LED, 1);
    digitalWrite(pinoLuz, 1);
    estadoDasLuzes = 0;
}

void acender() {
    digitalWrite(LED, 0);
    digitalWrite(pinoLuz, 0);
    estadoDasLuzes = 1;
}

void connectToServer() {

    bool connected = client.connect(websockets_server_host, websockets_server_port, "/api/v1/lights");

    if (connected) {
        Serial.println("Connected to server");
        sendMenssage("OFF", true);
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
