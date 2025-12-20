#!/usr/bin/env bash

# Script para restaurar el fondo de pantalla desde waypaper
# Lee el archivo de configuración de waypaper y aplica el fondo

waypaper_config="$HOME/.config/waypaper/config.ini"

if [ -f "$waypaper_config" ]; then
    # Leer el fondo de pantalla del config.ini
    wallpaper=$(grep "^wallpaper = " "$waypaper_config" | cut -d'=' -f2 | tr -d ' ')
    
    # Expandir ~ si está presente
    wallpaper="${wallpaper/#\~/$HOME}"
    
    # Verificar que el archivo existe
    if [ -f "$wallpaper" ]; then
        # Obtener el backend configurado
        backend=$(grep "^backend = " "$waypaper_config" | cut -d'=' -f2 | tr -d ' ')
        
        case "$backend" in
            hyprpaper)
                # Configurar hyprpaper
                hyprpaper preload "$wallpaper"
                # Obtener todos los monitores
                monitors=$(hyprctl monitors -j | jq -r '.[].name' 2>/dev/null || echo "")
                if [ -z "$monitors" ]; then
                    # Si no hay monitores detectados, usar el predeterminado
                    hyprpaper wallpaper "eDP-1,$wallpaper" 2>/dev/null || \
                    hyprpaper wallpaper "DP-1,$wallpaper" 2>/dev/null || \
                    hyprpaper wallpaper ",$wallpaper"
                else
                    # Aplicar a todos los monitores
                    for monitor in $monitors; do
                        hyprpaper wallpaper "$monitor,$wallpaper"
                    done
                fi
                ;;
            swww)
                swww img "$wallpaper" 2>/dev/null || true
                ;;
            *)
                # Si no reconocemos el backend, usar waypaper --restore
                waypaper --restore 2>/dev/null || true
                ;;
        esac
    else
        # Si el archivo no existe, usar waypaper --restore como fallback
        waypaper --restore 2>/dev/null || true
    fi
else
    # Si no existe el config, usar waypaper --restore
    waypaper --restore 2>/dev/null || true
fi





