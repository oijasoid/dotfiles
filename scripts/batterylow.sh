#!/bin/zsh

while true; do
	bat_lvl=$(cat /sys/class/power_supply/BAT1/capacity)
	bat_status=$(cat /sys/class/power_supply/BAT1/status)
	if [ "$bat_lvl" -le 30 ] && [ "$bat_status" = "Discharging" ]; then
		notify-send --urgency=CRITICAL "Battery Low" "Level:${bat_lvl}%" -i /usr/share/icons/Papirus-Dark/symbolic/status/battery-level-10-symbolic.svg
		sleep 1200
	else
		sleep 120
	fi
done
