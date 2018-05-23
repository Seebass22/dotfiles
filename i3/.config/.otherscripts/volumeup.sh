#!/usr/bin/env sh

pactl set-sink-volume $(pacmd list-sources | awk '/index/ {print $2;exit;}') +5%

echo "Volume increased"
