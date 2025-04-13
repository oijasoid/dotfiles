#!/usr/bin/env sh

if ! [[ -d $2 ]]; then
	echo "Output path does not exist!!"
	exit 1
fi

file="$2/$(date +Screenshot-%a-%m-%b-%H:%M:%S).png"

case $1 in
	"full")
		grim $file
		notify-send "Screenshot Captured" -i $file
		;;
	"region")
		grim -g "$(slurp)" $file
		notify-send "Screenshot Captured" -i $file
		;;
	*)
		echo "Invalid Input!"
		exit 1
esac
