#!/usr/bin/env bash

# Hyprland Shortcuts Viewer

show_hypr_shortcuts() {
    options_list=""
    options_list+=" Back\n"
    options_list+="󰖲 Super + Q: Cerrar ventana\n"
    options_list+="󰖲 Super + Space: Lanzador de apps\n"
    options_list+="󰖲 Super + V: Modo flotante (toggle)\n"
    options_list+="󰖲 Super + P: Pseudo-tile (toggle)\n"
    options_list+="󰖲 Super + J: Split horizontal/vertical\n"
    options_list+="󰖲 Super + Flechas: Mover foco\n"
    options_list+="󰖲 Super + 1-9: Cambiar de escritorio\n"
    options_list+="󰖲 Super + Shift + 1-9: Mover ventana a escritorio\n"
    options_list+="󰖲 F1/F2: Control de brillo\n"
    options_list+="󰖲 F3: Menú de apagado / Control Center\n"
    options_list+="󰖲 F11/F12: Control de volumen\n"

    chosen=$(echo -e "$options_list" | rofi -dmenu -i -p "Hyprland Shortcuts" -theme ~/.config/rofi/launcher.rasi)

    case $chosen in
        " Back")
            ~/.config/rofi/control-center/scripts/shortcuts-menu.sh
            ;;
        *)
            # Stay in the menu if a shortcut is clicked (or close if canceled)
            [ -n "$chosen" ] && show_hypr_shortcuts
            ;;
    esac
}

show_hypr_shortcuts
