#!/usr/bin/env bash

# Brightness Step
step=5

show_brightness_menu() {
    # Get current brightness
    brightness=$(brightnessctl g)
    max_brightness=$(brightnessctl m)
    percent=$(( 100 * brightness / max_brightness ))

    prompt="Brightness: $percent%"

    # Options
    up="󰃠 Increase Brightness (+$step%)"
    down="󰃟 Decrease Brightness (-$step%)"
    back=" Back"

    options="$up\n$down\n$back"

    chosen=$(echo -e "$options" | rofi -dmenu -i -p "$prompt" -theme ~/.config/rofi/launcher.rasi)

    case $chosen in
        $up)
            brightnessctl set ${step}%+
            show_brightness_menu
            ;;
        $down)
            brightnessctl set ${step}%-
            show_brightness_menu
            ;;
        $back)
            ~/.config/rofi/control-center/scripts/main-settings.sh
            ;;
    esac
}

show_brightness_menu
