print("Wait 10 seconds please")
tmr.alarm(0, 10000, 0, function() dofile('switch2.lua') end)