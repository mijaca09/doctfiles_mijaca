#!/bin/bash
set -e
echo "Instalando configuración de Starship..."
DOTFILES_DIR="$HOME/Code/mijaca09/dotfiles"
CONFIG_DIR="$HOME/.config"
[ -e "$CONFIG_DIR/starship.toml" ] && [ ! -L "$CONFIG_DIR/starship.toml" ] && mv "$CONFIG_DIR/starship.toml" "$CONFIG_DIR/starship.toml.backup.$(date +%Y%m%d_%H%M%S)"
[ -L "$CONFIG_DIR/starship.toml" ] && rm "$CONFIG_DIR/starship.toml"
ln -s "$DOTFILES_DIR/starship/starship.toml" "$CONFIG_DIR/starship.toml"
echo "✓ Starship instalado. Recarga con: source ~/.bashrc"
