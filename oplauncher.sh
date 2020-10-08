#!/bin/bash

for ARG in "$@"
do
# METEO & ROUTAGE
if [ "$ARG" == "xygrib" ]; then
XyGrib > /dev/null &
elif [ "$ARG" == "qtvlm" ]; then
/home/pi/qtVlm/QtVlm.sh > /dev/null &
elif [ "$ARG" == "signalk" ]; then
x-www-browser http://localhost:3000 > /dev/null &
elif [ "$ARG" == "opencpn" ]; then
opencpn > /dev/null &
elif [ "$ARG" == "bandg" ]; then
x-www-browser http://localhost:3000/plugins/signalk-node-red/redApi/ui/#!/0?socketid=BUb7JkjuorlFHjMUAAAB > /dev/null &
xdotool search --sync --onlyvisible --class "Chromium" windowactivate key F11
elif [ "$ARG" == "sailgauge" ]; then
x-www-browser http://localhost:3000/@signalk/sailgauge/ > /dev/null &
xdotool search --sync --onlyvisible --class "Chromium" windowactivate key F11
elif [ "$ARG" == "kip" ]; then
x-www-browser http://localhost:3000/@mxtommy/kip/#/page/0 > /dev/null &
xdotool search --sync --onlyvisible --class "Chromium" windowactivate key F11
elif [ "$ARG" == "sk_diagnostic" ]; then
diagnostic-SKinput > /dev/null &
elif [ "$ARG" == "serial" ]; then
openplotter-serial > /dev/null &
elif [ "$ARG" == "network" ]; then
openplotter-network > /dev/null &
elif [ "$ARG" == "I2C" ]; then
openplotter-i2c > /dev/null &
elif [ "$ARG" == "pypilot" ]; then
openplotter-pypilot > /dev/null &
elif [ "$ARG" == "canbus" ]; then
openplotter-can > /dev/null &
elif [ "$ARG" == "kplex" ]; then
openplotter-kplex > /dev/null &
elif [ "$ARG" == "checksystem" ]; then
openplotter-startup check > /dev/null &
elif [ "$ARG" == "desktop" ]; then
# Minimize interface
xdotool getactivewindow set_window --name OP_Launcher
xdotool search --name OP_Launcher windowminimize

speedtest-cli --simple

if [ $? -eq 0 ]
then
  xdotool search --name OP_Launcher windowactivate
  xdotool key "F11"
fi
fi
done
# Loading screen - Delay before switching back to main
sleep 8
