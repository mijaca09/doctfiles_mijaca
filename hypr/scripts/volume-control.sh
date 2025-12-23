#!/usr/bin/env bash

# Script para controlar el volumen con notificaciones (Corregido)

action=$1
step=${2:-5}

get_volume() {
    # wpctl get-volume devuelve algo como "Volume: 0.65" o "Volume: 1.00 [MUTED]"
    volume_raw=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
    # Usar bc para multiplicar y elevar a entero
    echo "($volume_raw * 100 + 0.5) / 1" | bc
}

case "$action" in
    mute)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        is_muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o "\[MUTED\]" || echo "")
        if [ -n "$is_muted" ]; then
            notify-send "Audio" "Muted" -h string:x-canonical-private-synchronous:volume -i audio-volume-muted
        else
            volume=$(get_volume)
            notify-send "Audio" "Unmuted - $volume%" -h string:x-canonical-private-synchronous:volume -h int:value:$volume -i audio-volume-high
        fi
        ;;
    down)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ ${step}%-
        volume=$(get_volume)
        notify-send "Volume" "$volume%" -h string:x-canonical-private-synchronous:volume -h int:value:$volume -i audio-volume-low
        ;;
    up)
        # Limitar al 100% si lo deseas, o permitir overclock
        wpctl set-volume @DEFAULT_AUDIO_SINK@ ${step}%+
        volume=$(get_volume)
        notify-send "Volume" "$volume%" -h string:x-canonical-private-synchronous:volume -h int:value:$volume -i audio-volume-high
        ;;
    *)
        echo "Usage: $0 {mute|down|up} [step]"
        exit 1
        ;;
esac
