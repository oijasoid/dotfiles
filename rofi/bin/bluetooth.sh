#!/usr/bin/env sh
rofi_command="rofi -theme $HOME/.config/rofi/config/bluetooth.rasi"

options="[turn off]"
options="${options}\n$(bluetoothctl devices | awk '{for (i=2; i<NF; i++) printf $i " "; print $NF}')"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0)"

case $chosen in
	"[turn off]")
		bluetoothctl power off
		;;
	*)
		rfkill unblock bluetooth
		bluetoothctl power on
		mac="$(echo -e "$chosen" | awk '{print $1}' )"
		bluetoothctl connect $mac
		;;
esac
