#!/bin/bash

function run {
	if ! pgrep -f $1 ;
	then 
		$@&
	fi
}

run compton
run xset r rate 200 150
run setxkbmap -layout "us,fr" -option "grp:alt_shift_toggle"
