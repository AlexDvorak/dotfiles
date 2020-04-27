#!/bin/dash

pkill -x polybar
pkill -x sxhkd
pkill -x dunst
echo "Waiting for processes to die"
wait
echo "Restarting processes"

/home/alex/.config/bspwm/bspwmrc
