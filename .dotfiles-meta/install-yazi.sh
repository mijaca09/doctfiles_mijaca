#!/bin/bash
set -e
echo "Instalando configuración de Yazi..."
DOTFILES_DIR="$HOME/Code/mijaca09/dotfiles"
CONFIG_DIR="$HOME/.config"
[ -e "$CONFIG_DIR/yazi" ] && [ ! -L "$CONFIG_DIR/yazi" ] && mv "$CONFIG_DIR/yazi" "$CONFIG_DIR/yazi.backup.$(date +%Y%m%d_%H%M%S)"
[ -L "$CONFIG_DIR/yazi" ] && rm "$CONFIG_DIR/yazi"
ln -s "$DOTFILES_DIR/yazi" "$CONFIG_DIR/yazi"
echo "✓ Yazi instalado"
