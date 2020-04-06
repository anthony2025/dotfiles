#!/bin/sh
# starts an x11 server and a desktop environment whitin
# this file requires xorg-xinit
# only exec last line on this file
# run with $ startx

# Disable beeps
xset -b &

# explicitely set backlight
xbacklight -set 20 &

# set caps to act as another ctrl key
setxkbmap -option caps:ctrl_modifier &

# set background color
xsetroot -solid '#800020' &

# start applications to later let i3 arrange them at start
keepassxc &
$BROWSER &
$TERMINAL &

# start notification manager
dunst &

# start windows manager
exec i3
