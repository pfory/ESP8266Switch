wifi.setmode(wifi.STATION)
wifi.sta.config("Datlovo","Nu6kMABmseYwbCoJ7LyG")   ---   SSID and Password for your LAN DHCP here

cfg={
  --ip = "192.168.1.154", halogen
  ip = "192.168.1.157", --venkovni chata
  netmask = "255.255.255.0",
  gateway = "192.168.1.1"
}
wifi.sta.setip(cfg)
wifi.sta.autoconnect(1)


uart.write(0,"Connecting to Wifi")
tmr.alarm(0, 1000, 1, function() 
  uart.write(0,".")
  if wifi.sta.status() == 5 and wifi.sta.getip() ~= nil then 
    tmr.stop(0) 
    print ("Wifi connected")
    print("System Info:  ")
    print("IP: ")
    print(wifi.sta.getip())
    majorVer, minorVer, devVer, chipid, flashid, flashsize, flashmode, flashspeed = node.info();
    print("NodeMCU "..majorVer.."."..minorVer.."."..devVer.."\nFlashsize: "..flashsize.."\nChipID: "..chipid)
    print("FlashID: "..flashid.."\n".."Flashmode: "..flashmode.."\nHeap: "..node.heap())
     -- get file system info
    remaining, used, total=file.fsinfo()
    print("\nFile system info:\nTotal : "..total.." Bytes\nUsed : "..used.." Bytes\nRemain: "..remaining.." Bytes")
    print("\nReady")
    dofile("servernode.lua")    --  calls servernode.lua  
    --dofile("switch.lua")    --  calls servernode.lua  
    dofile("switch2.lua")    --  calls servernode.lua  
  end
end)

    
