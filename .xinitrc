#!/bin/sh
#
# ~/.xinitrc
#
xsetroot -cursor_name left_ptr

picom &
setxkbmap en &
polybar &
nitrogen --restore &
# Start bspwm
exec bspwm
