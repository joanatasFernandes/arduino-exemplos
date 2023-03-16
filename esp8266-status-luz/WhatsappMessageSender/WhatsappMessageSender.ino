#include <ESP8266WiFi.h>
#include <ESP8266WiFiMulti.h>
#include <ThingESP.h>
#include <ESP8266HTTPClient.h>
#include <WiFiClient.h>

ThingESP8266 thing("thing user ", "thing project", "thing token");

int LED = LED_BUILTIN;
String phone = "Número do telefone";
unsigned long previousMillis = 0;
const long INTERVAL = 6000;

int sensor = 0;  // Pino input ligado ao sensor PIR
int pinoLuz = 1; // Pino output para ligar a luz

int mensagemMonitoramentoEnviada = 0;
int estadoDasLuzes = 1;
int apagamentoManual = 0;
int acendimentoManul = 0;

int contador = 0;

void apagar()
{
  digitalWrite(LED, 1);
  digitalWrite(pinoLuz, 1);
  estadoDasLuzes = 0;
}

void acender()
{
  digitalWrite(LED, 0);
  digitalWrite(pinoLuz, 0);
  estadoDasLuzes = 1;
}

void setup()
{
  Serial.begin(115200);
  pinMode(sensor, INPUT);
  pinMode(pinoLuz, OUTPUT);
  pinMode(LED, OUTPUT);

  thing.SetWiFi("Rende wifi", "Senha do wifi");
  thing.initDevice();
}

String HandleResponse(String query)
{
  if (query == "on")
  {
    acender();
    acendimentoManul = 1;
    return "(ENERGY-SAVE-MONITOR) - A luz foi acesa";
  }
  else if (query == "off")
  {
    apagar();
    apagamentoManual = 1;
    return "(ENERGY-SAVE-MONITOR) - A luz foi apagada";
  }
  else if (query == "status")
  {
    if (estadoDasLuzes == 0)
    {
      return "(ENERGY-SAVE-MONITOR) - A luz está apagada";
    }
    return "(ENERGY-SAVE-MONITOR) - A luz está acesa";
  }
  else
  {
    return "(ENERGY-SAVE-MONITOR) - Comando inválido";
  }
}

void alterarEstadoDaLuz()
{
  if (digitalRead(sensor) == LOW)
  {
    if (estadoDasLuzes == 1)
    {
      apagar();
      Serial.println("(ENERGY-SAVE-MONITOR) - Sem movimento detectado");
      thing.sendMsg(phone, "(ENERGY-SAVE-MONITOR) - Sem movimento detectado, apagando as luzes");
      delay(10000);
    }
  }
  else
  {
    if (estadoDasLuzes == 0)
    {
      acender();
      Serial.println("(ENERGY-SAVE-MONITOR) - Movimento detectado");
      thing.sendMsg(phone, "(ENERGY-SAVE-MONITOR) - Movimento detectado, acendendo as luzes");
      delay(15000);
    }
  }
}

void inicializarMonitoramento()
{
  if (mensagemMonitoramentoEnviada == 1)
  {
    if (apagamentoManual == 1)
    {
      delay(10000);
      apagamentoManual = 0;
    }
    else if (acendimentoManul == 1)
    {
      delay(15000);
      acendimentoManul = 0;
    }
    else
    {
      alterarEstadoDaLuz();
    }
  }
}

void alertaDeMonitoramento()
{
  if (contador <= 5)
  {
    contador++;
    delay(2000);
  }
  else if (mensagemMonitoramentoEnviada == 0)
  {
    mensagemMonitoramentoEnviada = 1;
    thing.sendMsg(phone, "(ENERGY-SAVE-MONITOR) - Monitoramento do estado da luz foi inicializado");
  }
}

void loop()
{
  thing.Handle();
  alertaDeMonitoramento();
  inicializarMonitoramento();
}
