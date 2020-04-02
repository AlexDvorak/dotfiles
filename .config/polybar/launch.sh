#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u 1000 -x polybar >/dev/null; do sleep 0.03; done

# Launch bar1 and bar2
polybar main &
#polybar top &
#polybar bottom &
#polybar top-ext &
#polybar bottom-ext &
