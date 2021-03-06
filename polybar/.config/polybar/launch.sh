#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
MONITOR=DVI-D-1 polybar example &
MONITOR=HDMI-4 polybar right &


echo "Bars launched..."
