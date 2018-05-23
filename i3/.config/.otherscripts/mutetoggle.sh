#!/usr/bin/env sh

pactl set-sink-mute $(pacmd list-sources | awk '/index/ {print $2;exit;}') toggle

echo "Mute toggled"
