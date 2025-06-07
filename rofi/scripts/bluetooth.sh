#!/usr/bin/env sh

echo -en "\0prompt\x1f\n"

if [ $ROFI_RETV -eq 0 ]
then
	echo "[turn off]"
	bluetoothctl devices | grep "Device" | awk '{printf $2 "\0display\x1f"; for (i=3;i<NF;i++) printf $i " "; print $NF}'
	exit 0
fi

if [ x"$@" = x"[turn off]" ]
then
	coproc ( bluetoothctl power off > /dev/null 2>&1 )
	exit 0
else
	rfkill unblock bluetooth
	coproc ( bluetoothctl power on > /dev/null 2>&1 )
	coproc ( bluetoothctl connect $1 > /dev/null 2>&1 )
	exit 0
fi
