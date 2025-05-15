#!/usr/bin/env sh

shutdown="󰐥"
reboot="󰜉"
lock="󰍁"
suspend="󰒲"
logout="󰍃"

if [ $ROFI_RETV -eq 0 ]
then
	echo -en "$shutdown\n$reboot\n$lock\n$suspend\n$logout"
else
	case $1 in
		$shutdown)
			systemctl poweroff
			;;
		$reboot)
			systemctl reboot
			;;
		$lock)
			loginctl lock-session
			;;
		$suspend)
			amixer set Master mute
			loginctl lock-session
			systemctl suspend
			;;
		$logout)
			hyprctl dispatch exit
			;;
	esac
fi
