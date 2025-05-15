#!/usr/bin/env sh

echo -en "\0prompt\x1f\n"

if [ $ROFI_RETV -eq 0 ]
then
	echo "[turn off]"
	bluetoothctl devices | awk '{printf $2 "\0display\x1f"; for (i=3;i<NF;i++) printf $i " "; print $NF}'
	exit 0
fi

if [ x"$@" = x"[turn off]" ]
then
	bluetoothctl power off
	exit 0
else
	rfkill unblock bluetooth
	bluetoothctl power on
	bluetoothctl connect $1
	exit 0
fi
