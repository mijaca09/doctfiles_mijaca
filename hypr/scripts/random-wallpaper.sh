#!/usr/bin/env bash
# Script para wallpaper aleatorio

WALLPAPER_DIR="$HOME/Pictures/walpaper"

if [ ! -d "$WALLPAPER_DIR" ]; then
    notify-send "Error" "Directorio de wallpapers no existe: $WALLPAPER_DIR"
    exit 1
fi

# Obtener wallpaper aleatorio
wallpaper=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" -o -name "*.webp" \) | shuf -n 1 | head -n 1)

if [ -n "$wallpaper" ]; then
    echo "🎨 Wallpaper aleatorio seleccionado: $(basename "$wallpaper")"
    ~/.config/hypr/scripts/change-wallpaper.sh "$wallpaper"
else
    notify-send "Error" "No se encontraron wallpapers en $WALLPAPER_DIR"
fi
