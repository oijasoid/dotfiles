#!/usr/bin/env sh

if ! pgrep -l swww-daemon ; then
	swww-daemon &
fi
swww img ~/.config/wallpaper --transition-fps=60 --transition-step=10 --transition-type=random --transition-duration=2 &
