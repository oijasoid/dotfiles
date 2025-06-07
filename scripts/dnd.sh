#!/usr/bin/env sh

disabled="notification-symbolic"
enabled="notification-disabled-new-symbolic"

if [ -z "$XDG_RUNTIME_DIR" ]; then
	export XDG_RUNTIME_DIR="/run/user/$(id -u)"
fi

export STATUS_FILE="$XDG_RUNTIME_DIR/dnd.status"

enable_dnd() {
	printf "true" >"$STATUS_FILE"

	notify-send -u low "Do Not Disturb" -h string:x-dunst-stack-tag:dnd -c system-control -i $enabled

	sleep 3

	dunstctl set-pause-level 50
}

disable_dnd() {
	printf "false" >"$STATUS_FILE"

	notify-send -u low "Notifications Enabled" -h string:x-dunst-stack-tag:dnd -c system-control -i $disabled

	dunstctl set-pause-level 0
}

if ! [ -f "$STATUS_FILE" ]; then
	enable_dnd	
else
	if [ "$(cat "$STATUS_FILE")" = "true" ]; then
		disable_dnd
	elif [ "$(cat "$STATUS_FILE")" = "false" ]; then
		enable_dnd
	fi
fi
