#!/usr/bin/env bash

# Bluetooth Management via rofi

show_bluetooth_menu() {
    # Check status
    power=$(bluetoothctl show | grep "Powered: yes" > /dev/null && echo "on" || echo "off")
    
    if [ "$power" == "on" ]; then
        prompt="Bluetooth: ON"
        toggle="󰂲 Disable Bluetooth"
        # List paired devices
        devices=$(bluetoothctl devices Paired | awk '{print "󰂱 " $3 " (" $2 ")" }')
        scan="󰂰 Scan for Devices"
    else
        prompt="Bluetooth: OFF"
        toggle="󰂯 Enable Bluetooth"
        devices=""
        scan=""
    fi
    
    back=" Back"
    
    options="$toggle\n$scan\n$devices\n$back"
    
    chosen=$(echo -e "$options" | rofi -dmenu -i -p "$prompt" -theme ~/.config/rofi/launcher.rasi)
    
    case $chosen in
        $toggle)
            if [ "$power" == "on" ]; then
                bluetoothctl power off
            else
                bluetoothctl power on
            fi
            show_bluetooth_menu
            ;;
        $scan)
            notify-send "Bluetooth" "Scanning for devices..."
            bluetoothctl scan on &
            sleep 5
            bluetoothctl scan off
            show_bluetooth_menu
            ;;
        $back)
            ~/.config/rofi/control-center/scripts/main-settings.sh
            ;;
        "")
            exit 0
            ;;
        *)
            # Extract MAC and connect
            if [[ $chosen == 󰂱* ]]; then
                mac=$(echo "$chosen" | grep -oE "([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}")
                notify-send "Bluetooth" "Connecting to $mac..."
                bluetoothctl connect "$mac"
            fi
            show_bluetooth_menu
            ;;
    esac
}

show_bluetooth_menu
