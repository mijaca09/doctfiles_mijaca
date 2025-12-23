#!/usr/bin/env bash

# Wallpaper Menu for Hyprpaper with PREVIEWS

wallpaper_dir="/home/mijaca/Pictures/walpaper"

show_wallpaper_menu() {
    # Get current monitor
    monitor=$(hyprctl monitors | grep "Monitor" | head -n1 | awk '{print $2}')

    # Construct the list with icons
    options_list=""
    options_list+=" Back\0icon\x1fgo-previous\n"
    
    # Iterate through wallpapers
    while IFS= read -r file; do
        if [ -n "$file" ]; then
            options_list+="$file\0icon\x1f$wallpaper_dir/$file\n"
        fi
    done < <(ls "$wallpaper_dir" | grep -E "\.(jpg|jpeg|png)$")

    chosen=$(echo -e "$options_list" | rofi -dmenu -i -p "Wallpaper Preview" -show-icons -theme ~/.config/rofi/control-center/scripts/wallpaper.rasi)

    case $chosen in
        " Back")
            ~/.config/rofi/control-center/scripts/main-settings.sh
            ;;
        "")
            exit 0
            ;;
        *)
            wallpaper_path="$wallpaper_dir/$chosen"
            if [ -f "$wallpaper_path" ]; then
                notify-send "Wallpaper" "Setting $chosen..."
                
                # Apply immediately
                hyprctl hyprpaper preload "$wallpaper_path"
                hyprctl hyprpaper wallpaper "$monitor,$wallpaper_path"
                hyprctl hyprpaper unload all
                
                # Make persistent
                echo "preload = $wallpaper_path" > ~/.config/hypr/hyprpaper.conf
                echo "wallpaper = $monitor,$wallpaper_path" >> ~/.config/hypr/hyprpaper.conf
            fi
            show_wallpaper_menu
            ;;
    esac
}

show_wallpaper_menu
