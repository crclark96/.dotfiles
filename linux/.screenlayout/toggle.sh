#!/bin/sh

num_displays=$(xrandr | grep " connected " | wc -l)

if [ $num_displays -eq 1 ]; then
    xrandr --output eDP-1 --primary --mode 3840x2160 --pos 3840x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off
else
    xrandr --output eDP-1 --primary --mode 3840x2160 --pos 3960x0 --rotate normal --output DP-1 --off --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --scale 2x2 --output DP-2 --off
fi

