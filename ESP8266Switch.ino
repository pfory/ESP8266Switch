#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include "Adafruit_MQTT.h"
#include "Adafruit_MQTT_Client.h"

const char *ssid = "Datlovo";
const char *password = "Nu6kMABmseYwbCoJ7LyG";

#define AIO_SERVER      "192.168.1.56"
#define AIO_SERVERPORT  1883
#define AIO_USERNAME    "datel"
#define AIO_KEY         "hanka12"

WiFiClient client;

byte heartBeat = 10;
byte status    = 0;

Adafruit_MQTT_Client mqtt(&client, AIO_SERVER, AIO_SERVERPORT, AIO_USERNAME, AIO_KEY);

unsigned int const sendTimeDelay=60000;
signed long lastSendTime = sendTimeDelay * -1;

/****************************** Feeds ***************************************/
Adafruit_MQTT_Publish switchVersionSW = Adafruit_MQTT_Publish(&mqtt, "/home/Switch1/esp03/VersionSW");
Adafruit_MQTT_Publish switchHeartBeat = Adafruit_MQTT_Publish(&mqtt, "/home/Switch1/esp03/HeartBeat");
Adafruit_MQTT_Publish switchStatus    = Adafruit_MQTT_Publish(&mqtt, "/home/Switch1/esp03/Status");

Adafruit_MQTT_Subscribe com           = Adafruit_MQTT_Subscribe(&mqtt, "/home/Switch1/esp03/com");
Adafruit_MQTT_Subscribe restart       = Adafruit_MQTT_Subscribe(&mqtt, "/home/Switch1/esp03/restart");

#define SERIALSPEED 115200

#define relayPin 2

void MQTT_connect(void);

float versionSW                   = 0.1;
String versionSWString            = "Switch v";

void setup() {
  Serial.begin(SERIALSPEED);
  Serial.print(versionSWString);
  Serial.println(versionSW);
  pinMode(relayPin, OUTPUT);
  
  Serial.println(ESP.getResetReason());
  if (ESP.getResetReason()=="Software/System restart") {
    heartBeat=11;
  } else if (ESP.getResetReason()=="Power on") {
    heartBeat=12;
  } else if (ESP.getResetReason()=="External System") {
    heartBeat=13;
  } else if (ESP.getResetReason()=="Hardware Watchdog") {
    heartBeat=14;
  } else if (ESP.getResetReason()=="Exception") {
    heartBeat=15;
  } else if (ESP.getResetReason()=="Software Watchdog") {
    heartBeat=16;
  } else if (ESP.getResetReason()=="Deep-Sleep Wake") {
    heartBeat=17;
  }
  
  WiFi.begin(ssid, password);

	// Wait for connection
	while (WiFi.status() != WL_CONNECTED) {
		delay(500);
		Serial.print(".");
	}

	Serial.println("");
	Serial.print("Connected to ");
	Serial.println(ssid);
	Serial.print("IP address: ");
	Serial.println(WiFi.localIP());
  
  mqtt.subscribe(&com);
  mqtt.subscribe(&restart);
}

void loop() {
  // Ensure the connection to the MQTT server is alive (this will make the first
  // connection and automatically reconnect when disconnected).  See the MQTT_connect
  // function definition further below.
  MQTT_connect();

  Adafruit_MQTT_Subscribe *subscription;
  while ((subscription = mqtt.readSubscription(5000))) {
    if (subscription == &com) {
      Serial.print(F("got: "));
      Serial.println((char *)com.lastread);
      if (strcmp((char *)com.lastread, "OFF") == 0) {
        digitalWrite(relayPin, HIGH); // make GPIO2 output low
        Serial.println("Relay OFF");
        status = 0;
      } else {
        digitalWrite(relayPin, LOW); // make GPIO2 output low
        Serial.println("Relay ON");
        status = 1;
      }
      if (! switchStatus.publish(status)) {
        Serial.println("failed");
      } else {
        Serial.println("OK!");
      }
    }
    if (subscription == &restart) {
      char *pNew = (char *)restart.lastread;
      uint32_t pPassw=atol(pNew); 
      if (pPassw==650419) {
        Serial.print(F("Restart ESP now!"));
        ESP.restart();
      } else {
        Serial.print(F("Wrong password."));
      }
    }
  }

 if (millis() - lastSendTime >= sendTimeDelay) {
    lastSendTime = millis();
    if (! switchHeartBeat.publish(heartBeat++)) {
      Serial.println("failed");
    } else {
      Serial.println("OK!");
    }
    if (heartBeat>1) {
      heartBeat=0;
    }
    if (! switchVersionSW.publish(versionSW)) {
      Serial.println("failed");
    } else {
      Serial.println("OK!");
    }
    if (! switchStatus.publish(status)) {
      Serial.println("failed");
    } else {
      Serial.println("OK!");
    }
  }
  // ping the server to keep the mqtt connection alive
  // NOT required if you are publishing once every KEEPALIVE seconds
  /*
  if(! mqtt.ping()) {
    mqtt.disconnect();
  }
  */

}

// Function to connect and reconnect as necessary to the MQTT server.
// Should be called in the loop function and it will take care if connecting.
void MQTT_connect() {
  int8_t ret;

  // Stop if already connected.
  if (mqtt.connected()) {
    return;
  }

  Serial.print("Connecting to MQTT... ");

  uint8_t retries = 3;
  while ((ret = mqtt.connect()) != 0) { // connect will return 0 for connected
       Serial.println(mqtt.connectErrorString(ret));
       Serial.println("Retrying MQTT connection in 5 seconds...");
       mqtt.disconnect();
       delay(5000);  // wait 5 seconds
       retries--;
       if (retries == 0) {
         // basically die and wait for WDT to reset me
         while (1);
       }
  }
  Serial.println("MQTT Connected!");
}