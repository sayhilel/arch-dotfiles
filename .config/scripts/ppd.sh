#!/usr/env zsh

echo -e "Select Power Profile [0-2]\n0. Performance\n1. Balanced\n2. Power-saver" 

read op
  
if [ $op -eq 0 ]; then
	powerprofilesctl set performance
	notify-send "Profile set: performance"
elif [ $op -eq 1 ]; then
	powerprofilesctl set balanced
	notify-send "Profile set: balanced"
elif [ $op -eq 2 ]; then
	powerprofilesctl set power-saver
	notify-send "Profile set: power-saver"
else
	notify-send ":Profile not set: Not a valid option" 
fi
