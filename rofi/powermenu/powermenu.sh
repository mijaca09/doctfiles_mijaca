#!/usr/bin/env bash

# Power Menu script using Rofi with Toggle functionality

# Check if rofi is already running
if pgrep -x "rofi" > /dev/null; then
    pkill -x "rofi"
    exit 0
fi

# Options in English
settings="󰒓 Control Center"
shutdown="�� Shutdown"
reboot="󰜉 Reboot"
logout="󰈆 Logout"

# Variable passed to rofi
options="$settings\n$shutdown\n$reboot\n$logout"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu" -theme ~/.config/rofi/powermenu/powermenu.rasi)

case $chosen in
    $settings)
        ~/.config/rofi/control-center/scripts/main-settings.sh
        ;;
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $logout)
        hyprctl dispatch exit
        ;;
esac
