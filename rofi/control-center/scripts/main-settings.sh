#!/usr/bin/env bash

# Main Settings Menu (Control Center)

show_main_settings() {
    wifi="󰖩 Wi-Fi Settings"
    bluetooth="󰂯 Bluetooth Settings"
    volume="󰕾 Volume Control"
    brightness="󰃠 Brightness Control"
    wallpaper="󰸉 Wallpapers"
    shortcuts="󰘳 Shortcuts"
    power="󰐥 Power Menu"
    back=" Exit"

    options="$wifi\n$bluetooth\n$volume\n$brightness\n$wallpaper\n$shortcuts\n$power\n$back"

    chosen=$(echo -e "$options" | rofi -dmenu -i -p "Control Center" -theme ~/.config/rofi/launcher.rasi)

    case $chosen in
        $wifi)
            ~/.config/wifimenu/scripts/wifimenu
            ;;
        $bluetooth)
            ~/.config/rofi/control-center/scripts/bluetooth-menu.sh
            ;;
        $volume)
            ~/.config/rofi/control-center/scripts/volume-menu.sh
            ;;
        $brightness)
            ~/.config/rofi/control-center/scripts/brightness-menu.sh
            ;;
        $wallpaper)
            ~/.config/rofi/control-center/scripts/wallpaper-menu.sh
            ;;
        $shortcuts)
            ~/.config/rofi/control-center/scripts/shortcuts-menu.sh
            ;;
        $power)
            ~/.config/rofi/powermenu/powermenu.sh
            ;;
        *)
            exit 0
            ;;
    esac
}

show_main_settings
