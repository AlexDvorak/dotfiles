#!/usr/bin/ion

echo "Killing processes"
pkill -x sxhkd
pkill -x dunst
pkill -x polybar
echo "Restarting processes"

/home/alex/.config/bspwm/bspwmrc
echo "finished setup"
