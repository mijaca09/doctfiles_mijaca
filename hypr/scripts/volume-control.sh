#!/usr/bin/env bash

# Script para controlar el volumen con notificaciones

action=$1
step=${2:-5}

case "$action" in
    mute)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        is_muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o "\[MUTED\]" || echo "")
        if [ -n "$is_muted" ]; then
            notify-send "Audio" "Muted" -h string:x-canonical-private-synchronous:volume
        else
            volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2*100}' | cut -d. -f1)
            notify-send "Audio" "Unmuted - $volume%" -h string:x-canonical-private-synchronous:volume
        fi
        ;;
    down)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ ${step}%-
        volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2*100}' | cut -d. -f1)
        notify-send "Volume" "$volume%" -h string:x-canonical-private-synchronous:volume -h int:value:$volume
        ;;
    up)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ ${step}%+
        volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2*100}' | cut -d. -f1)
        notify-send "Volume" "$volume%" -h string:x-canonical-private-synchronous:volume -h int:value:$volume
        ;;
    *)
        echo "Usage: $0 {mute|down|up} [step]"
        exit 1
        ;;
esac




