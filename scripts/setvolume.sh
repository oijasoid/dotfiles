#!/usr/bin/env sh

case $1 in
	"mic")
		device="@DEFAULT_AUDIO_SOURCE@"
		icon="microphone-sensitivity-medium-symbolic"
		micon="microphone-sensitivity-none-symbolic"
		;;
	"speaker")
		device="@DEFAULT_AUDIO_SINK@"
		icon="audio-volume-medium-symbolic"
		micon="audio-volume-muted-symbolic"
		;;
	*)
		echo "Invalid Device!"
		return 1
esac

case $2 in
	"toggle")
		wpctl set-mute $device toggle

		muted=$(wpctl get-volume $device | awk '{print $3}')

		if ! [[ -z $muted ]]; then
			notify-send -u low -h string:x-dunst-stack-tag:volume -i $micon "Muted"
			return 0
		fi

		val=$(wpctl get-volume $device | awk '{print $2}')
		percent=$(printf "%d" $((val * 100)))

		notify-send -u low -h int:value:$percent -h string:x-dunst-stack-tag:volume -i $icon "Volume" "$percent%"
		;;
	*)
		if [[ $2 =~ "[a-zA-Z\`~!@#$^&*()_={}:;\\[\\]\"\',<>\/?|\\]+" ]]; then
			echo "Invalid Volume!"
			return 1
		fi
		if ! [[ $2 =~ "[0-9]+\.?[0-9]*%?(\+|\-)?" ]]; then
			echo "Invalid Volume!"
			return 1
		fi
		wpctl set-volume $device $2 -l 1.0

		val=$(wpctl get-volume $device | awk '{print $2}')
		percent=$(printf "%d" $((val * 100)))

		muted=$(wpctl get-volume $device | awk '{print $3}')

		if ! [[ -z $muted ]]; then
			notify-send -u low -h int:value:$percent -h string:x-dunst-stack-tag:volume -i $micon "Volume" "$percent%"
			return 0
		fi

		notify-send -u low -h int:value:$percent -h string:x-dunst-stack-tag:volume -i $icon "Volume" "$percent%"
		;;
esac
