#!/usr/bin/env bash

# Script para cambiar wallpaper fácilmente
# Uso: ./change-wallpaper.sh ruta/a/wallpaper.png

if [ -z "$1" ]; then
    echo "Uso: $0 <ruta al wallpaper>"
    echo ""
    echo "Ejemplos:"
    echo "  $0 ~/Pictures/walpaper/imagen.png"
    echo "  $0 ~/Pictures/background.jpg"
    echo ""
    echo "Para wallpapers en ~/Pictures/walpaper/:"
    echo "  $0~/Pictures/walpaper/nombre.jpg"
    exit 1
fi

wallpaper_path="$1"
wallpaper_expanded="${wallpaper_path/#\~/$HOME}"

# Verificar que el archivo existe
if [ ! -f "$wallpaper_expanded" ]; then
    echo "⚠ Error: El archivo no existe: $wallpaper_expanded"
    exit 1
fi

# Actualizar config de waypaper
sed -i "s|^wallpaper = .*|wallpaper = $wallpaper_expanded|" ~/.config/waypaper/config.ini

# Obtener el backend
backend=$(grep "^backend = " ~/.config/waypaper/config.ini | cut -d'=' -f2 | tr -d ' ')

echo "🎨 Cambiando wallpaper a: $wallpaper_expanded"

# Aplicar wallpaper según el backend
case "$backend" in
    hyprpaper)
        # Obtener monitores
        monitors=$(hyprctl monitors -j | jq -r '.[] | select(.active == true) | .name' 2>/dev/null || echo "")
        
        if [ -n "$monitors" ]; then
            for monitor in $monitors; do
                echo "📺 Aplicando a monitor: $monitor"
                hyprpaper preload "$wallpaper_expanded"
                sleep 0.5
                hyprpaper wallpaper "$monitor,$wallpaper_expanded"
            done
        else
            # Fallback
            hyprpaper preload "$wallpaper_expanded"
            hyprpaper wallpaper "$wallpaper_expanded"
        fi
        ;;
    www)
        www img "$wallpaper_expanded" 2>/dev/null || echo "⚠ www backend no disponible"
        ;;
    *)
        echo "⚠ Backend no reconocido: $backend"
        exit 1
        ;;
esac

echo "✓ Wallpaper cambiado exitosamente"
echo ""
echo "🔄 Recargando Hyprpaper..."
hyprctl hyprpaper reload

echo "✓ Listo! El nuevo fondo debería estar visible"
