#!/usr/bin/env bash

# Script mejorado para restaurar el fondo de pantalla desde waypaper
# Se ejecuta al inicio de Hyprland

# Esperar un poco para que Hyprpaper esté completamente cargado
sleep 2

# Configurar Hyprpaper
hyprctl hyprpaper reload

# Leer configuración de waypaper
waypaper_config="$HOME/.config/waypaper/config.ini"

if [ -f "$waypaper_config" ]; then
    # Extraer el wallpaper del config
    wallpaper=$(grep "^wallpaper = " "$waypaper_config" | cut -d'=' -f2 | tr -d ' ')
    
    # Expandir ~ si está presente
    wallpaper="${wallpaper/#\~/$HOME}"
    
    # Verificar que el archivo existe
    if [ -f "$wallpaper" ]; then
        echo "Restaurando wallpaper: $wallpaper"
        
        # Preload del wallpaper
        hyprctl hyprpaper preload "$wallpaper"
        
        # Obtener todos los monitores activos
        monitors=$(hyprctl monitors -j | jq -r '.[] | select(.active == true) | .name' 2>/dev/null)
        
        if [ -n "$monitors" ]; then
            # Aplicar a todos los monitores activos
            for monitor in $monitors; do
                echo "Aplicando wallpaper a monitor: $monitor"
                hyprctl hyprpaper wallpaper "$monitor,$wallpaper"
            done
        else
            # Fallback: aplicar a todos los monitores
            echo "No se detectaron monitores activos, aplicando a todos..."
            hyprctl hyprpaper wallpaper "all,$wallpaper"
        fi
        
        echo "✓ Wallpaper restaurado exitosamente"
    else
        echo "⚠ No se encontró el archivo de wallpaper: $wallpaper"
        # Fallback: usar waypaper --restore
        waypaper --restore 2>/dev/null || echo "⚠ No se pudo restaurar con waypaper --restore"
    fi
else
    echo "⚠ No se encontró config de waypaper"
    # Fallback: usar waypaper --restore
    waypaper --restore 2>/dev/null || echo "⚠ No se pudo restaurar con waypaper --restore"
fi

echo "Script de restauración de wallpaper completado"


