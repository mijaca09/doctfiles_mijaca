#!/usr/bin/env bash

# Neovim Shortcuts Viewer (LazyVim based)

show_nvim_shortcuts() {
    options_list=""
    options_list+=" Back\n"
    options_list+=" Leader: Space\n"
    options_list+=" Leader + e: Explorer (Neo-tree)\n"
    options_list+=" Leader + ff: Buscar archivos\n"
    options_list+=" Leader + sg: Buscar texto (Live Grep)\n"
    options_list+=" Leader + bb: Cambiar entre buffers\n"
    options_list+=" Leader + bd: Cerrar buffer\n"
    options_list+=" Leader + /: Terminal (toggle)\n"
    options_list+=" Leader + u: Ajustes de interfaz (UI)\n"
    options_list+=" Ctrl + c (Visual): Copiar al sistema\n"
    options_list+=" Leader + y: Copiar línea al sistema\n"
    options_list+=" Leader + p: Pegar desde el sistema\n"
    options_list+=" K: Ver documentación (LSP)\n"
    options_list+=" gd: Ir a definición\n"

    chosen=$(echo -e "$options_list" | rofi -dmenu -i -p "Neovim Shortcuts" -theme ~/.config/rofi/launcher.rasi)

    case $chosen in
        " Back")
            ~/.config/rofi/control-center/scripts/shortcuts-menu.sh
            ;;
        *)
            [ -n "$chosen" ] && show_nvim_shortcuts
            ;;
    esac
}

show_nvim_shortcuts
