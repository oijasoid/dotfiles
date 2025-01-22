#!/usr/bin/env sh
rofi_command="rofi -theme $HOME/.config/rofi/config/clipboard.rasi"

options="[wipe]"
options="${options}\n$(cliphist list)"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0)"

case $chosen in
	"[wipe]")
		cliphist wipe
		;;
	"")
		;;
	*)
		echo -n "$(printf $chosen)" | cliphist decode | wl-copy
		;;
esac
