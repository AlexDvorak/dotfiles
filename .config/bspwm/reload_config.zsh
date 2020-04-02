#! /usr/bin/zsh

echo "Killing Polybar, Dunst, and SXHKD";
killall -q polybar;
killall -q dunst
killall -q sxhkd



if [[ $(cat /sys/class/drm/card0-HDMI-A-1/status) == "connected" || $(cat /sys/class/drm/card0-HDMI-A-2/status) == "connected" ]] {

  echo "Reconfiguring Desktop for HDMI-2";
  xrandr --output HDMI-2 --mode 1920x1200 --primary --right-of eDP-1;

  echo "Waiting for Polybar to die";
  while pgrep -u 1000 -x polybar >/dev/null; do
    sleep 0.01;
  done

  echo "Restarting Polybar";
  polybar main &;
  
  echo "Reconfiguring Desktops";
  bspc monitor HDMI-2 -d 1 2 3 4 5 6
  bspc monitor eDP-1  -d 1 2 3 4 5 6

} else {

  echo "Reconfiguring Desktop for Laptop display only";
  bspc monitor eDP-1 -d 1 2 3 4 5 6 7 8 9 10

}


bspc config border_width   3
bspc config window_gap     2

bspc config split_ratio          0.60
bspc config borderless_monocle   true
bspc config gapless_monocle      true

bspc config active_border_color  '#F55050'
bspc config normal_border_color  '#75756e'
bspc config focused_border_color '#A26FBF'

echo "Restarting SXHKD, Dunst, and Polybar for main display";
sxhkd &;
dunst &;
polybar main-laptop &;

echo "Configuring Keyboard layout";
xmodmap /home/alex/.xmodmap
