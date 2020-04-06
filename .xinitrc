#!/bin/sh
# starts an x11 server and a desktop environment whitin
# this file requires xorg-xinit
# only exec last line on this file
# run with $ startx

# load settings for X server, do not ampersand this line
[[ -f $HOME/.Xresources ]] && xrdb -merge -I$HOME $HOME/.Xresources

# Disable beeps
xset -b &

# explicitely set backlight
xbacklight -set 20 &

# set caps to act as another ctrl key
setxkbmap -option caps:ctrl_modifier &

# set background color
xsetroot -solid '#800020' &

# start notification manager
dunst &

# start a terminal
$TERMINAL &

# start windows manager
exec i3
