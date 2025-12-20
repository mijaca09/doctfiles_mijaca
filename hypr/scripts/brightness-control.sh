#!/usr/bin/env bash

# Script para controlar el brillo de la pantalla con notificaciones

action=$1
step=${2:-5}

# Función para obtener el brillo actual en porcentaje
get_brightness() {
    if command -v brightnessctl &> /dev/null; then
        # Obtener el porcentaje directamente de brightnessctl info
        brightnessctl info | grep -oP '\(\K[0-9]+(?=%\))' || echo "50"
    else
        BACKLIGHT_PATH="/sys/class/backlight/intel_backlight"
        MAX_BRIGHTNESS=$(cat "$BACKLIGHT_PATH/max_brightness" 2>/dev/null || echo "100")
        CURRENT_BRIGHTNESS=$(cat "$BACKLIGHT_PATH/brightness" 2>/dev/null || echo "50")
        echo $((CURRENT_BRIGHTNESS * 100 / MAX_BRIGHTNESS))
    fi
}

case "$action" in
    down)
        # Disminuir brillo usando brightnessctl
        if command -v brightnessctl &> /dev/null; then
            # Intentar sin sudo primero, luego con sudo si falla
            if ! brightnessctl set ${step}%- > /dev/null 2>&1; then
                sudo brightnessctl set ${step}%- > /dev/null 2>&1
            fi
        else
            # Método alternativo para sistemas sin brightnessctl
            BACKLIGHT_PATH="/sys/class/backlight/intel_backlight"
            MAX_BRIGHTNESS=$(cat "$BACKLIGHT_PATH/max_brightness" 2>/dev/null || echo "100")
            CURRENT_BRIGHTNESS=$(cat "$BACKLIGHT_PATH/brightness" 2>/dev/null || echo "50")
            current_percent=$((CURRENT_BRIGHTNESS * 100 / MAX_BRIGHTNESS))
            new_percent=$((current_percent - step))
            if [ $new_percent -lt 1 ]; then
                new_percent=1
            fi
            new_brightness=$((MAX_BRIGHTNESS * new_percent / 100))
            
            if echo $new_brightness > "$BACKLIGHT_PATH/brightness" 2>/dev/null; then
                :
            else
                echo $new_brightness | sudo tee "$BACKLIGHT_PATH/brightness" > /dev/null 2>&1
            fi
        fi
        
        # Obtener el nuevo porcentaje para la notificación
        new_percent=$(get_brightness)
        notify-send "Brillo" "$new_percent%" -h string:x-canonical-private-synchronous:brightness -h int:value:$new_percent
        ;;
    up)
        # Aumentar brillo usando brightnessctl
        if command -v brightnessctl &> /dev/null; then
            # Intentar sin sudo primero, luego con sudo si falla
            if ! brightnessctl set +${step}% > /dev/null 2>&1; then
                sudo brightnessctl set +${step}% > /dev/null 2>&1
            fi
        else
            # Método alternativo para sistemas sin brightnessctl
            BACKLIGHT_PATH="/sys/class/backlight/intel_backlight"
            MAX_BRIGHTNESS=$(cat "$BACKLIGHT_PATH/max_brightness" 2>/dev/null || echo "100")
            CURRENT_BRIGHTNESS=$(cat "$BACKLIGHT_PATH/brightness" 2>/dev/null || echo "50")
            current_percent=$((CURRENT_BRIGHTNESS * 100 / MAX_BRIGHTNESS))
            new_percent=$((current_percent + step))
            if [ $new_percent -gt 100 ]; then
                new_percent=100
            fi
            new_brightness=$((MAX_BRIGHTNESS * new_percent / 100))
            
            if echo $new_brightness > "$BACKLIGHT_PATH/brightness" 2>/dev/null; then
                :
            else
                echo $new_brightness | sudo tee "$BACKLIGHT_PATH/brightness" > /dev/null 2>&1
            fi
        fi
        
        # Obtener el nuevo porcentaje para la notificación
        new_percent=$(get_brightness)
        notify-send "Brillo" "$new_percent%" -h string:x-canonical-private-synchronous:brightness -h int:value:$new_percent
        ;;
    *)
        echo "Usage: $0 {down|up} [step]"
        exit 1
        ;;
esac

