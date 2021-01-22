#!/bin/sh
# starts an x11 server and a desktop environment whitin
# this file requires xorg-xinit
# only exec last line on this file
# run with $ startx

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --dpi 96

# load settings for X server, do not ampersand this line
[[ -f ${XDG_CONFIG_HOME}/X11/Xresources ]] && xrdb -merge -I$HOME $XDG_CONFIG_HOME/X11/Xresources

# Disable beeps
xset -b &

# turn on num lock
numlockx &

# explicitely set backlight
xbacklight -set 20 &

# set caps to act as another ctrl key
setxkbmap -option caps:ctrl_modifier &

# set a nicer cursor
xsetroot -cursor_name left_ptr

# set background color
# xsetroot -solid '#4E0707' &

# set background wallpaper
feh --bg-scale /usr/share/backgrounds/archlinux/simple.png

# start notification manager
dunst &

# start a terminal
# $TERMINAL &

# start windows manager
exec xmonad
