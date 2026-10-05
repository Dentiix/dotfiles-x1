#!/bin/bash

MONITOR="eDP-1"
RESOLUTION="preferred"
POSITION="auto"
SCALE="1.2"

# Deine Gerätenamen
TOUCH="wacom-pen-and-multitouch-sensor-finger"
PEN="wacom-pen-and-multitouch-sensor-pen"

# Sensordaten auslesen und Monitor sowie Touch rotieren
monitor-sensor | while read -r line; do
  if [[ $line == *"orientation changed"* ]]; then
    if [[ $line == *"normal"* ]]; then
      hyprctl eval "hl.monitor({ output = '$MONITOR', mode = '$RESOLUTION', position = '$POSITION', scale = $SCALE, transform = 0 })"
      hyprctl eval "hl.device({ name = '$TOUCH', transform = 0 })"
      hyprctl eval "hl.device({ name = '$PEN', transform = 0 })"
    elif [[ $line == *"bottom-up"* ]]; then
      hyprctl eval "hl.monitor({ output = '$MONITOR', mode = '$RESOLUTION', position = '$POSITION', scale = $SCALE, transform = 2 })"
      hyprctl eval "hl.device({ name = '$TOUCH', transform = 2 })"
      hyprctl eval "hl.device({ name = '$PEN', transform = 2 })"
    elif [[ $line == *"right-up"* ]]; then
      hyprctl eval "hl.monitor({ output = '$MONITOR', mode = '$RESOLUTION', position = '$POSITION', scale = $SCALE, transform = 3 })"
      hyprctl eval "hl.device({ name = '$TOUCH', transform = 3 })"
      hyprctl eval "hl.device({ name = '$PEN', transform = 3 })"
    elif [[ $line == *"left-up"* ]]; then
      hyprctl eval "hl.monitor({ output = '$MONITOR', mode = '$RESOLUTION', position = '$POSITION', scale = $SCALE, transform = 1 })"
      hyprctl eval "hl.device({ name = '$TOUCH', transform = 1 })"
      hyprctl eval "hl.device({ name = '$PEN', transform = 1 })"
    fi
  fi
done
