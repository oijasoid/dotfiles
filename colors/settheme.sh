#!/usr/bin/env sh

while getopts ht:w: OPTION
do
	case $OPTION in
		w)
			if [[ ! -f $OPTARG ]]; then
				echo "ERROR: Not a valid file!!"
				break;
			fi
			if [[ ! ( $OPTARG == *.jpg || $OPTARG == *.png )]]; then
				echo "ERROR: Not a png or jpg!!"
				break;
			fi

			ln -sf $OPTARG ~/.config/wallpaper
			;;
		t)
			if [[ ! -f $OPTARG ]]; then
				echo "ERROR: Not a valid file!!"
				break;
			fi

			. $OPTARG
			;;
		h)
			echo "Usage: settheme -t [themefile...] -w [wallpaper...]"
			echo "Options:"
			echo "  -h                help"
			echo "  -t [themefile]    choose theme"
			echo "  -w [wallpaper]    choose wallpaper"
			exit 0
	esac
done

kitty_colors=~/.config/kitty/colors.conf
hypr_colors=~/.config/hypr/colors.conf
rofi_colors=~/.config/rofi/options.rasi
waybar_colors=~/.config/waybar/theme.css
zathura_colors=~/.config/zathura/colors
sddm_colors=/usr/share/sddm/themes/custom/theme.conf
dunt_colors=~/.config/dunst/dunstrc.d/options.conf
qt5ct_colors=~/.config/qt5ct/colors/Colors.conf
qt6ct_colors=~/.config/qt6ct/colors/Colors.conf

reload=~/.config/scripts/reload.sh

# Kitty
echo -e "selection_foreground    $selection_foreground" > $kitty_colors
echo -e "selection_background    $selection_background\n" >> $kitty_colors

echo -e "background              $background" >> $kitty_colors
echo -e "foreground              $foreground\n" >> $kitty_colors

echo -e "color0                  $color0" >> $kitty_colors
echo -e "color1                  $color1" >> $kitty_colors
echo -e "color2                  $color2" >> $kitty_colors
echo -e "color3                  $color3" >> $kitty_colors
echo -e "color4                  $color4" >> $kitty_colors
echo -e "color5                  $color5" >> $kitty_colors
echo -e "color6                  $color6" >> $kitty_colors
echo -e "color7                  $color7" >> $kitty_colors
echo -e "color8                  $color8" >> $kitty_colors
echo -e "color9                  $color9" >> $kitty_colors
echo -e "color10                 $color10" >> $kitty_colors
echo -e "color11                 $color11" >> $kitty_colors
echo -e "color12                 $color12" >> $kitty_colors
echo -e "color13                 $color13" >> $kitty_colors
echo -e "color14                 $color14" >> $kitty_colors
echo -e "color15                 $color15\n" >> $kitty_colors

echo -e "cursor                  $color7" >> $kitty_colors
echo -e "cursor_text_color       $color8\n" >> $kitty_colors

echo -e "url_color               $url_color" >> $kitty_colors

# Hyprland
echo -e "\$bg   =    rgb(${background//#})" > $hypr_colors
echo -e "\$bga  =    rgb(${color0//#})" >> $hypr_colors
echo -e "\$fg   =    rgb(${foreground//#})\n" >> $hypr_colors

echo -e "\$yellow  =    rgb(${color3//#})" >> $hypr_colors
echo -e "\$red     =    rgb(${color9//#})\n" >> $hypr_colors

echo -e "\$activeBorder    =    rgb(${highlight//#})" >> $hypr_colors
echo -e "\$inactiveBorder  =    rgb(${background//#})\n" >> $hypr_colors

echo -e "\$font = $font" >> $hypr_colors

# Rofi
echo -e "* {" > $rofi_colors
echo -e "\tBG:             $background;" >> $rofi_colors
echo -e "\tBGA:            $color0;" >> $rofi_colors
echo -e "\tFG:             $foreground;" >> $rofi_colors
echo -e "\tBDR:            $highlight;" >> $rofi_colors
echo -e "\tUGT:            $color9;\n" >> $rofi_colors

echo -e "\tfont-normal:    \"$font 12\";" >> $rofi_colors
echo -e "\tfont-power:     \"$font 60\";" >> $rofi_colors
echo -e "}" >> $rofi_colors

# Waybar
echo -e "@define-color text        $foreground;\n" > $waybar_colors
echo -e "@define-color base        $background;\n" >> $waybar_colors

echo -e "@define-color black1      $color0;" >> $waybar_colors
echo -e "@define-color black2      $color8;" >> $waybar_colors
echo -e "@define-color red1        $color1;" >> $waybar_colors
echo -e "@define-color red2        $color9;" >> $waybar_colors
echo -e "@define-color green1      $color2;" >> $waybar_colors
echo -e "@define-color green2      $color10;" >> $waybar_colors
echo -e "@define-color yellow1     $color3;" >> $waybar_colors
echo -e "@define-color yellow2     $color11;" >> $waybar_colors
echo -e "@define-color blue1       $color4;" >> $waybar_colors
echo -e "@define-color blue2       $color12;" >> $waybar_colors
echo -e "@define-color purple1     $color5;" >> $waybar_colors
echo -e "@define-color purple2     $color13;" >> $waybar_colors
echo -e "@define-color aqua1       $color6;" >> $waybar_colors
echo -e "@define-color aqua2       $color14;" >> $waybar_colors
echo -e "@define-color white1      $color7;" >> $waybar_colors
echo -e "@define-color white2      $color15;\n" >> $waybar_colors

echo -e "* { font-family: $font; }" >> $waybar_colors

# Zathura
hl_red=$(echo $((16#${highlight:1:2})))
hl_green=$(echo $((16#${highlight:3:2})))
hl_blue=$(echo $((16#${highlight:5:2})))
hla_red=$(echo $((16#${highlight2:1:2})))
hla_green=$(echo $((16#${highlight2:3:2})))
hla_blue=$(echo $((16#${highlight2:5:2})))

echo -e "set notification-error-bg         \"$color0\"" > $zathura_colors
echo -e "set notification-error-fg         \"$color1\"" >> $zathura_colors
echo -e "set notification-warning-bg       \"$color0\"" >> $zathura_colors
echo -e "set notification-warning-fg       \"$color3\"" >> $zathura_colors
echo -e "set notification-bg               \"$color0\"" >> $zathura_colors
echo -e "set notification-fg               \"$foreground\"\n" >> $zathura_colors

echo -e "set completion-bg                 \"$color0\"" >> $zathura_colors
echo -e "set completion-fg                 \"$foreground\"" >> $zathura_colors
echo -e "set completion-group-bg           \"$color0\"" >> $zathura_colors
echo -e "set completion-group-fg           \"$highlight\"" >> $zathura_colors
echo -e "set completion-highlight-bg       \"$color8\"" >> $zathura_colors
echo -e "set completion-highlight-fg       \"$foreground\"\n" >> $zathura_colors

echo -e "set index-bg                      \"$background\"" >> $zathura_colors
echo -e "set index-fg                      \"$foreground\"" >> $zathura_colors
echo -e "set index-active-bg               \"$color0\"" >> $zathura_colors
echo -e "set index-active-fg               \"$foreground\"\n" >> $zathura_colors

echo -e "set inputbar-bg                   \"$color0\"" >> $zathura_colors
echo -e "set inputbar-fg                   \"$foreground\"" >> $zathura_colors
echo -e "set statusbar-bg                  \"$color0\"" >> $zathura_colors
echo -e "set statusbar-fg                  \"$foreground\"\n" >> $zathura_colors

echo -e "set highlight-color               \"rgba($hl_red,$hl_green,$hl_blue,0.5)\"" >> $zathura_colors
echo -e "set highlight-active-color        \"rgba($hla_red,$hla_green,$hla_blue,0.5)\"" >> $zathura_colors
echo -e "set highlight-fg                  \"$color0\"\n" >> $zathura_colors

echo -e "set default-bg                    \"$background\"" >> $zathura_colors
echo -e "set default-fg                    \"$foreground\"\n" >> $zathura_colors

echo -e "set render-loading                true" >> $zathura_colors
echo -e "set render-loading-fg             \"$foreground\"" >> $zathura_colors
echo -e "set render-loading-bg             \"$background\"\n" >> $zathura_colors

echo -e "set recolor-lightcolor            \"$background\"" >> $zathura_colors
echo -e "set recolor-darkcolor             \"$foreground\"" >> $zathura_colors
echo -e "set recolor-reverse-video         true" >> $zathura_colors
echo -e "set recolor-keephue               true" >> $zathura_colors
echo -e "set recolor                       true" >> $zathura_colors

# SDDM
echo -e "[General]" > $sddm_colors
echo -e "Font=\"$font\"" >> $sddm_colors
echo -e "FontSize=16" >> $sddm_colors
echo -e "CustomBackgrounds=\"true\"" >> $sddm_colors
echo -e "LoginBackground=\"true\"" >> $sddm_colors
echo -e "Background=backgrounds/wall.jpg\n" >> $sddm_colors

echo -e "red    = \"$color9\"" >> $sddm_colors
echo -e "blue   = \"$color6\"" >> $sddm_colors
echo -e "fg     = \"$foreground\"" >> $sddm_colors
echo -e "bg     = \"$background\"" >> $sddm_colors
echo -e "bga    = \"$color0\"" >> $sddm_colors

# Dunst
echo -e "[global]" > $dunt_colors
echo -e "background = \"$background\"" >> $dunt_colors
echo -e "foreground = \"$foreground\"" >> $dunt_colors
echo -e "highlight = \"$highlight\"" >> $dunt_colors
echo -e "frame_color = \"$highlight\"\n" >> $dunt_colors

echo -e "font = $font 12" >> $dunt_colors
echo -e "icon_theme = $icon_theme\n" >> $dunt_colors

echo -e "[urgency_critical]" >> $dunt_colors
echo -e "highlight = \"$color1\"" >> $dunt_colors
echo -e "frame_color = \"$color1\"\n" >> $dunt_colors

echo -e "[system-control]" >> $dunt_colors
echo -e "highlight = \"$foreground\"" >> $dunt_colors
echo -e "frame_color = \"$foreground\"\n" >> $dunt_colors

echo -e "# vim: ft=cfg" >> $dunt_colors

# QT
qt_colors="$foreground, $background, $background, $color7"
qt_colors="${qt_colors}, $color0, $color8, $foreground, $foreground"
qt_colors="${qt_colors}, $foreground, $background, $background, $color8"
qt_colors="${qt_colors}, $color0, $foreground, $highlight2, $highlight"
qt_colors="${qt_colors}, $background, $foreground, $background, $foreground"
qt_colors="${qt_colors}, $color7"

# QT5CT
echo -e "[ColorScheme]" > $qt5ct_colors
echo -e "active_colors=$qt_colors" >> $qt5ct_colors
echo -e "inactive_colors=$qt_colors" >> $qt5ct_colors
echo -e "disabled_colors=$qt_colors" >> $qt5ct_colors

# QT6CT
echo -e "[ColorScheme]" > $qt6ct_colors
echo -e "active_colors=$qt_colors" >> $qt6ct_colors
echo -e "inactive_colors=$qt_colors" >> $qt6ct_colors
echo -e "disabled_colors=$qt_colors" >> $qt6ct_colors

exec $reload
