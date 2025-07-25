#!/usr/bin/env sh

echo -en "\0prompt\x1f\n"

if [ $ROFI_RETV -eq 0 ]
then
	echo "[wipe]"
	cliphist list | awk '{printf $1 "\0display\x1f"; for (i=2;i<NF;i++) printf $i " "; print $NF}'
	exit 0
fi

if [ x"$@" = x"[wipe]" ]
then
	cliphist wipe
	wl-copy --clear
	exit 0
else
	printf $1 | cliphist decode | wl-copy
	exit 0
fi
