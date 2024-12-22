#!/bin/zsh

if ! pgrep -l swww-daemon ; then
	swww-daemon &
fi
swww img ~/.config/wallpaper --transition-fps=60 --transition-step=5 --transition-type=center &
