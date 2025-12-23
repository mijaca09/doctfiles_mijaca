#!/usr/bin/env bash
# Script para wallpaper anterior

HISTORY_FILE="$HOME/.cache/wallpaper_history.txt"

if [ -f "$HISTORY_FILE" ] && [ -s "$HISTORY_FILE" ]; then
    # Leer penúltimo wallpaper (excluyendo el actual)
    previous=$(tail -n 2 "$HISTORY_FILE" | head -n 1)
    
    if [ -n "$previous" ]; then
        echo "⏪ Restaurando wallpaper anterior: $(basename "$previous")"
        ~/.config/hypr/scripts/change-wallpaper.sh "$previous"
    else
        echo "⚠ No hay wallpaper anterior en el historial"
    fi
else
    echo "⚠ No hay historial de wallpapers disponible"
fi
