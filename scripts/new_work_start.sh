#!/bin/bash
wmctrl -s 1
# code ~/Projects/composed/ldek/leknanuxt &
code ~/Documents/flutter/LekNaSmartfony &
sleep 1
wmctrl -s 2
code ~/Documents/python/LekNaServer &
sleep 1
gnome-terminal -- /bin/sh -c './development/redis/redis-server; exec bash' &
sleep 1
wmctrl -s 3
code ~/Documents/python/potrace_icon &
sleep 1
wmctrl -s 4
code ~/Projects/Python/xlsx2lang
sleep 1
wmctrl -s 1
