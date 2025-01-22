#!/usr/bin/env sh

brightnessctl s $1 $2 $3

val=$(brightnessctl g)
max=$(brightnessctl m)

percent=$(((val*100)/max))

echo "$val $max $percent"

notify-send -u low -h int:value:$percent\
		-h string:x-dunst-stack-tag:brightness\
		-i display-brightness-medium-symbolic "Brightness" "$percent%"
