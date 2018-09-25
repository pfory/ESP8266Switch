#include <SI7021.h>
#include <ESP8266WiFi.h>
#include <WiFiClient.h>
//#include <ESP8266WebServer.h>
#include "Adafruit_MQTT.h"
#include "Adafruit_MQTT_Client.h"
#include <WiFiManager.h> 

//for LED status
#include <Ticker.h>

unsigned long       start=0;
unsigned long       bootTime;

Ticker ticker;

void tick()
{
  //toggle state
  int state = digitalRead(BUILTIN_LED);  // get the current state of GPIO1 pin
  digitalWrite(BUILTIN_LED, !state);     // set pin to the opposite state
}
  
#define PORADI1
//#define PORADI2
  
#define verbose
#ifdef verbose
 #define DEBUG_PRINT(x)         Serial.print (x)
 #define DEBUG_PRINTDEC(x)      Serial.print (x, DEC)
 #define DEBUG_PRINTLN(x)       Serial.println (x)
 #define DEBUG_PRINTF(x, y)     Serial.printf (x, y)
 #define PORTSPEED 115200
#else
 #define DEBUG_PRINT(x)
 #define DEBUG_PRINTDEC(x)
 #define DEBUG_PRINTLN(x)
 #define DEBUG_PRINTF(x, y)
#endif 
  
#define           PINRELAY       4 //GPIO2

#define AIO_SERVER      "192.168.1.56"
//#define AIO_SERVER      "178.77.238.20"
#define AIO_SERVERPORT  1883
#define AIO_USERNAME    "datel"
#define AIO_KEY         "hanka12"

unsigned long milisLastRunMinOld          = 0;


WiFiClient client;
WiFiManager wifiManager;

Adafruit_MQTT_Client mqtt(&client, AIO_SERVER, AIO_SERVERPORT, AIO_USERNAME, AIO_KEY);

/****************************** Feeds ***************************************/
#ifdef PORADI1
#define MQTTBASE "/home/Switch1/esp01/"
#endif
#ifdef PORADI2
#define MQTTBASE "/home/Switch2/esp02/"
#endif
Adafruit_MQTT_Publish _state                   = Adafruit_MQTT_Publish(&mqtt, MQTTBASE "state");
Adafruit_MQTT_Publish _voltage                 = Adafruit_MQTT_Publish(&mqtt, MQTTBASE "Voltage");
Adafruit_MQTT_Publish _versionSW               = Adafruit_MQTT_Publish(&mqtt, MQTTBASE "VersionSW");
Adafruit_MQTT_Publish _hb                      = Adafruit_MQTT_Publish(&mqtt, MQTTBASE "HeartBeat");

Adafruit_MQTT_Subscribe _command               = Adafruit_MQTT_Subscribe(&mqtt, MQTTBASE "/com");

#ifdef PORADI1
IPAddress _ip           = IPAddress(192, 168, 1, 120);
#endif
#ifdef PORADI2
IPAddress _ip           = IPAddress(192, 168, 1, 121);
#endif
IPAddress _gw           = IPAddress(192, 168, 1, 1);
IPAddress _sn           = IPAddress(255, 255, 255, 0);


ADC_MODE(ADC_VCC);

void MQTT_connect(void);

//gets called when WiFiManager enters configuration mode
void configModeCallback (WiFiManager *myWiFiManager) {
  Serial.println("Entered config mode");
  Serial.println(WiFi.softAPIP());
  //if you used auto generated SSID, print it
  Serial.println(myWiFiManager->getConfigPortalSSID());
  //entered config mode, make led toggle faster
  ticker.attach(0.2, tick);
}

float versionSW                   = 0.6;
#ifdef PORADI1
String versionSWString            = "Switch#1 v";
#endif
#ifdef PORADI2
String versionSWString            = "Switch#2 v";
#endif
uint32_t heartBeat                = 0;

void setup() {
#ifdef verbose
  Serial.begin(PORTSPEED);
#endif
  DEBUG_PRINTLN();
  DEBUG_PRINT(versionSWString);
  DEBUG_PRINTLN(versionSW);
  DEBUG_PRINT("START:");
  DEBUG_PRINTLN(start);
  //set led pin as output
  pinMode(BUILTIN_LED, OUTPUT);
  // start ticker with 0.5 because we start in AP mode and try to connect
  ticker.attach(0.6, tick);
  
  DEBUG_PRINTLN(ESP.getResetReason());
  if (ESP.getResetReason()=="Software/System restart") {
    heartBeat=1;
  } else if (ESP.getResetReason()=="Power on") {
    heartBeat=2;
  } else if (ESP.getResetReason()=="External System") {
    heartBeat=3;
  } else if (ESP.getResetReason()=="Hardware Watchdog") {
    heartBeat=4;
  } else if (ESP.getResetReason()=="Exception") {
    heartBeat=5;
  } else if (ESP.getResetReason()=="Software Watchdog") {
    heartBeat=6;
  } else if (ESP.getResetReason()=="Deep-Sleep Wake") {
    heartBeat=7;
  }

  //set callback that gets called when connecting to previous WiFi fails, and enters Access Point mode
  wifiManager.setSTAStaticIPConfig(_ip, _gw, _sn);
  wifiManager.setAPCallback(configModeCallback);
  
  #ifdef PORADI1
  if (!wifiManager.autoConnect("Switch1", "password")) {
  #endif
  #ifdef PORADI2
  if (!wifiManager.autoConnect("Switch2", "password")) {
  #endif
    DEBUG_PRINTLN("failed to connect, we should reset as see if it connects");
    delay(3000);
    ESP.reset();
    delay(5000);
  }

	DEBUG_PRINTLN("");
	DEBUG_PRINT("Connected to ");
	DEBUG_PRINT("IP address: ");
	DEBUG_PRINTLN(WiFi.localIP());
  
  ticker.detach();
  //keep LED on
  digitalWrite(BUILTIN_LED, HIGH);
  
  mqtt.subscribe(&_command);
  
  pinMode(PINRELAY, OUTPUT);
  digitalWrite(PINRELAY,LOW);  
}

void loop() {
  MQTT_connect();

  if (millis() - milisLastRunMinOld > 60000) {
    milisLastRunMinOld = millis();
    if (! _hb.publish(heartBeat)) {
      DEBUG_PRINTLN("Send HB failed");
    } else {
      DEBUG_PRINTLN("Send HB OK!");
    }
    heartBeat++;
    if (! _versionSW.publish(versionSW)) {
      DEBUG_PRINT(F("Send verSW failed!"));
    } else {
      DEBUG_PRINT(F("Send verSW OK!"));
    }
    if (! _voltage.publish(ESP.getVcc())) {
      DEBUG_PRINTLN("Send napeti failed");
    } else {
      DEBUG_PRINTLN("Send napeti OK!");
    }
  }

 
  Adafruit_MQTT_Subscribe *subscription;
  while ((subscription = mqtt.readSubscription(2000))) {
    if (subscription == &_command) {
      // convert mqtt ascii payload to int
      char *value = (char *)_command.lastread;
      DEBUG_PRINT(F("Received: "));
      DEBUG_PRINTLN(value);
   
      // Apply message to lamp
      String message = String(value);
      message.trim();
      if (message == "ON") {digitalWrite(PINRELAY, HIGH);}
      if (message == "OFF") {digitalWrite(PINRELAY, LOW);}
    }
  }
}

// Function to connect and reconnect as necessary to the MQTT server.
// Should be called in the loop function and it will take care if connecting.
void MQTT_connect() {
  int8_t ret;

  // Stop if already connected.
  if (mqtt.connected()) {
    return;
  }

  DEBUG_PRINT("Connecting to MQTT... ");

  uint8_t retries = 3;
  while ((ret = mqtt.connect()) != 0) { // connect will return 0 for connected
       DEBUG_PRINTLN(mqtt.connectErrorString(ret));
       DEBUG_PRINTLN("Retrying MQTT connection in 5 seconds...");
       mqtt.disconnect();
       delay(5000);  // wait 5 seconds
       retries--;
       if (retries == 0) {
         // basically die and wait for WDT to reset me
         while (1);
       }
  }
  DEBUG_PRINTLN("MQTT Connected!");
}

String getValue(String data, char separator, int index) {
  int found = 0;
  int strIndex[] = {0, -1};
  int maxIndex = data.length()-1;

  for(int i=0; i<=maxIndex && found<=index; i++){
    if(data.charAt(i)==separator || i==maxIndex){
        found++;
        strIndex[0] = strIndex[1]+1;
        strIndex[1] = (i == maxIndex) ? i+1 : i;
    }
  }

  return found>index ? data.substring(strIndex[0], strIndex[1]) : "";
}