#!/usr/bin/env sh

hyprctl reload

killall waybar
hyprctl dispatch exec waybar

killall dunst
hyprctl dispatch exec dunst

swww img ~/.config/wallpaper
