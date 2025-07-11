#!/usr/bin env bash

if pidof hypridle 1> /dev/null ; then
	notify-send -i "$HOME/media/images/icons/idle.png" "Idle Inhibited"
	pkill hypridle 1> /dev/null 
else
	notify-send -i "$HOME/media/images/icons/idle.png" "Idle Resumed"
	hypridle 1> /dev/null & disown 
fi
