#!/usr/bin/env sh
rofi_command="rofi -theme $HOME/.config/rofi/config/powermenu.rasi"

uptime=$(uptime -p | sed -e 's/up //g')

# Options
if [[ "$DIR" == "powermenus" ]]; then
	shutdown=""
	reboot=""
	lock=""
	suspend=""
	logout=""
	ddir="$HOME/.config/rofi/config"
else

# For some reason the Icons are mess up I don't know why but to fix it uncomment section 2 and comment section 1 but if the section 1 icons are mess up uncomment section 2 and comment section 1

	# Buttons
	layout=`cat $HOME/.config/rofi/config/powermenu.rasi | grep BUTTON | cut -d'=' -f2 | tr -d '[:blank:],*/'`
	if [[ "$layout" == "TRUE" ]]; then
		shutdown="󰐥"
		reboot="󰜉"
		lock="󰍁"
		suspend="󰒲"
		logout="󰍃"


	else
		shutdown="󰐥Shutdown"
		reboot="󰜉 Restart"
		lock="󰍁 Lock"
		suspend="󰒲Sleep"
		logout="󰍃 Logout"
	fi
	ddir="$HOME/.config/rofi/config"
fi

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 0)"
case $chosen in
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

