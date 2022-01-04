#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar -c ~/.config/polybar/config.ini --reload vanir &
    done
else
    # Launch Polybar, using default config location ~/.config/polybar/config
    polybar -c ~/.config/polybar/config.ini vanir -r &
fi

echo "Polybar launched..."
