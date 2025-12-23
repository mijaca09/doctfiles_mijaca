#!/usr/bin/env bash

# Volume Step
step=5

show_volume_menu() {
    # Get current volume
    volume_raw=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
    volume=$(echo "($volume_raw * 100 + 0.5) / 1" | bc)
    is_muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o "\[MUTED\]")

    if [ -n "$is_muted" ]; then
        prompt="Volume: MUTED ($volume%)"
    else
        prompt="Volume: $volume%"
    fi

    # Options
    up="󰝝 Increase Volume (+$step%)"
    down="󰝞 Decrease Volume (-$step%)"
    mute="󰝟 Toggle Mute"
    back=" Back"

    options="$up\n$down\n$mute\n$back"

    chosen=$(echo -e "$options" | rofi -dmenu -i -p "$prompt" -theme ~/.config/rofi/launcher.rasi)

    case $chosen in
        $up)
            wpctl set-volume @DEFAULT_AUDIO_SINK@ ${step}%+
            show_volume_menu
            ;;
        $down)
            wpctl set-volume @DEFAULT_AUDIO_SINK@ ${step}%-
            show_volume_menu
            ;;
        $mute)
            wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
            show_volume_menu
            ;;
        $back)
            ~/.config/rofi/control-center/scripts/main-settings.sh
            ;;
    esac
}

show_volume_menu
