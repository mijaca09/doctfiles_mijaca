#!/usr/bin/env bash

# Shortcuts Submenu

show_shortcuts_menu() {
    hypr=" Hyprland"
    tmux=" Tmux"
    nvim=" Neovim"
    back=" Back"

    options="$hypr\n$tmux\n$nvim\n$back"

    chosen=$(echo -e "$options" | rofi -dmenu -i -p "Shortcuts" -theme ~/.config/rofi/launcher.rasi)

    case $chosen in
        $hypr)
            ~/.config/rofi/control-center/scripts/hypr-shortcuts.sh
            ;;
        $tmux)
            ~/.config/rofi/control-center/scripts/tmux-shortcuts.sh
            ;;
        $nvim)
            ~/.config/rofi/control-center/scripts/nvim-shortcuts.sh
            ;;
        $back)
            ~/.config/rofi/control-center/scripts/main-settings.sh
            ;;
        *)
            exit 0
            ;;
    esac
}

show_shortcuts_menu
