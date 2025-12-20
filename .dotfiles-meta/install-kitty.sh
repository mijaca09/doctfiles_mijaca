#!/bin/bash
set -e
echo "Instalando configuración de Kitty..."
DOTFILES_DIR="$HOME/Code/mijaca09/dotfiles"
CONFIG_DIR="$HOME/.config"
[ -e "$CONFIG_DIR/kitty" ] && [ ! -L "$CONFIG_DIR/kitty" ] && mv "$CONFIG_DIR/kitty" "$CONFIG_DIR/kitty.backup.$(date +%Y%m%d_%H%M%S)"
[ -L "$CONFIG_DIR/kitty" ] && rm "$CONFIG_DIR/kitty"
ln -s "$DOTFILES_DIR/kitty" "$CONFIG_DIR/kitty"
echo "✓ Kitty instalado. Recarga con Ctrl+Shift+F5"
