#!/bin/bash
# Script de instalación individual para Hyprland
set -e

echo "Instalando configuración de Hyprland..."

DOTFILES_DIR="$HOME/Code/mijaca09/dotfiles"
CONFIG_DIR="$HOME/.config"

# Backup si existe
if [ -e "$CONFIG_DIR/hypr" ] && [ ! -L "$CONFIG_DIR/hypr" ]; then
    echo "⚠ Creando backup..."
    mv "$CONFIG_DIR/hypr" "$CONFIG_DIR/hypr.backup.$(date +%Y%m%d_%H%M%S)"
fi

# Eliminar symlink si existe
[ -L "$CONFIG_DIR/hypr" ] && rm "$CONFIG_DIR/hypr"

# Crear symlink
ln -s "$DOTFILES_DIR/hypr" "$CONFIG_DIR/hypr"

echo "✓ Hyprland instalado: $CONFIG_DIR/hypr → $DOTFILES_DIR/hypr"
echo "Reinicia Hyprland para ver los cambios"
