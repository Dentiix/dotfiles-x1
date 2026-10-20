#!/bin/bash
# Liest die aktuelle Helligkeit in Prozent aus
current=$(brightnessctl -m | awk -F, '{print substr($4, 1, length($4)-1)}')

# Berechnet die nächste 10er-Stufe
next=$(((current / 10 + 1) * 10))

# Wenn über 100%, fange wieder bei 10% an
if [ "$next" -gt 100 ]; then
  next=10
fi

brightnessctl set "${next}%"
