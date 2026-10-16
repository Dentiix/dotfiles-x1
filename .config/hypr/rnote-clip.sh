#!/usr/bin/env bash

sleep 0.2

# 3. Bereich mit dem Stift auswählen (Snipping-Tool-Stil)
GEOM=$(slurp -d -b '#ffffff80' -c '#0078d7ff' -s '#00000000' -w 2)

if [ -z "$GEOM" ]; then
  exit 0
fi

# 4. Screenshot erstellen und entkoppelt ins Clipboard laden
sleep 0.05
TMP_IMG="/tmp/rnote-clip.png"
grim -g "$GEOM" "$TMP_IMG"
wl-copy -t image/png <"$TMP_IMG" >/dev/null 2>&1 &
