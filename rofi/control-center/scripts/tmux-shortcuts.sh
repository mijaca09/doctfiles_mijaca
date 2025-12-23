#!/usr/bin/env bash

# Tmux Shortcuts Viewer

show_tmux_shortcuts() {
    options_list=""
    options_list+=" Back\n"
    options_list+=" Prefix: Ctrl + A\n"
    options_list+=" Prefix + |: Dividir panel horizontal\n"
    options_list+=" Prefix + -: Dividir panel vertical\n"
    options_list+=" Prefix + C: Nueva ventana\n"
    options_list+=" Prefix + X: Cerrar panel\n"
    options_list+=" Prefix + f: Zoom de panel (toggle)\n"
    options_list+=" Prefix + S: Gestor de sesiones (popup)\n"
    options_list+=" Prefix + ?: Buscador de atajos (popup)\n"
    options_list+=" Alt + Flechas: Cambiar entre paneles\n"
    options_list+=" Ctrl + h/j/k/l: Navegación panel (Vim friendly)\n"
    options_list+=" Prefix + Ctrl + s: Guardar sesiones\n"
    options_list+=" Prefix + Ctrl + r: Restaurar sesiones\n"

    chosen=$(echo -e "$options_list" | rofi -dmenu -i -p "Tmux Shortcuts" -theme ~/.config/rofi/launcher.rasi)

    case $chosen in
        " Back")
            ~/.config/rofi/control-center/scripts/shortcuts-menu.sh
            ;;
        *)
            [ -n "$chosen" ] && show_tmux_shortcuts
            ;;
    esac
}

show_tmux_shortcuts
