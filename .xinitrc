#!/bin/sh
# starts an x11 server and a desktop environment whitin
# this file requires xorg-xinit
# run with $ startx

# set caps to act as another ctrl key
setxkbmap -option caps:ctrl_modifier

# start windows manager
exec i3
