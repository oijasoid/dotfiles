#!/usr/bin/env sh
rofi \
	-show drun \
	-modi drun \
	-scroll-method 0 \
	-drun-match-fields all \
	-drun-display-format "{name}" \
	-no-drun-show-actions \
	-terminal kitty \
	-theme "$HOME"/.config/rofi/config/launcher.rasi
