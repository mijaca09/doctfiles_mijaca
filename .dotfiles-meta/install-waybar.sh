#!/bin/bash
set -e
echo "Instalando configuración de Waybar..."
DOTFILES_DIR="$HOME/Code/mijaca09/dotfiles"
CONFIG_DIR="$HOME/.config"
[ -e "$CONFIG_DIR/waybar" ] && [ ! -L "$CONFIG_DIR/waybar" ] && mv "$CONFIG_DIR/waybar" "$CONFIG_DIR/waybar.backup.$(date +%Y%m%d_%H%M%S)"
[ -L "$CONFIG_DIR/waybar" ] && rm "$CONFIG_DIR/waybar"
ln -s "$DOTFILES_DIR/waybar" "$CONFIG_DIR/waybar"
echo "✓ Waybar instalado"
