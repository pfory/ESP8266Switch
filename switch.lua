--Init  
base = "/home/Switch1/esp01/"
deviceID = "ESP8266 Switch "..node.chipid()

heartBeat = node.bootreason() + 10
print("Boot reason:"..heartBeat)

--Broker="88.146.202.186"  
Broker="192.168.1.56"

versionSW         = 0.52
versionSWString   = "Switch v" 
print(versionSWString .. versionSW)

pinRelay = 4 --GPIO2
gpio.mode(pinRelay,gpio.OUTPUT)  
gpio.write(pinRelay,gpio.LOW)  

function reconnect()
  print ("Waiting for Wifi")
  if wifi.sta.status() == 5 and wifi.sta.getip() ~= nil then 
    print ("Wifi Up!")
    tmr.stop(1) 
    m:connect(Broker, 1883, 0, 1, function(conn) 
      print(wifi.sta.getip())
      print("Mqtt Connected to:" .. Broker) 
      mqtt_sub() --run the subscription function 
    end)
  end
end


function mqtt_sub()  
  m:subscribe(base.."com",0, function(conn)   
    print("Mqtt Subscribed to OpenHAB feed for device "..deviceID)  
  end)  
end  

m = mqtt.Client(deviceID, 180, "datel", "hanka12")  
m:lwt("/lwt", deviceID, 0, 0)  
m:on("offline", function(conn)   
  print("Mqtt Reconnecting...")   
  tmr.alarm(1, 10000, 1, function()  
    reconnect()
  end)
end)  


function sendData()
  print("I am sending data to OpenHab")
  m:publish(base.."HeartBeat",   heartBeat,0,0)
  m:publish(base.."VersionSW",   versionSW,0,0)  
  if heartBeat==0 then heartBeat=1
  else heartBeat=0
  end
end

-- on publish message receive event  
m:on("message", function(conn, topic, data)   
  print("Received:" .. topic .. ":" .. data) 
  if topic == base.."com" then
    if data == "ON" then
      print("Relay ON")
      gpio.write(pinRelay,gpio.HIGH)  
      tmr.alarm(5, 3600000, 1, function()  --safety function
        gpio.write(pinRelay,gpio.LOW)  
      end)
    else
      print("Relay OFF")
      gpio.write(pinRelay,gpio.LOW)  
    end
  end
end)  

m:connect(Broker, 1883, 0, 1, function(conn) 
  mqtt_sub() --run the subscription function 
  print(wifi.sta.getip())
  print("Mqtt Connected to:" .. Broker.." - "..base) 
  sendData()
  tmr.alarm(2, 60000, 1, function()  
    sendData()
  end)
end) 