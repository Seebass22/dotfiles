#!/usr/bin/env sh

polybar-msg cmd quit

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
MONITOR=DisplayPort-2 polybar main 2>&1 | tee -a /tmp/polybar1.log & disown
MONITOR=HDMI-A-0 polybar secondary 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."
