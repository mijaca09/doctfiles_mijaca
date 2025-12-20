#!/bin/bash
set -e
echo "Instalando configuración de Zellij..."
DOTFILES_DIR="$HOME/Code/mijaca09/dotfiles"
CONFIG_DIR="$HOME/.config"
[ -e "$CONFIG_DIR/zellij" ] && [ ! -L "$CONFIG_DIR/zellij" ] && mv "$CONFIG_DIR/zellij" "$CONFIG_DIR/zellij.backup.$(date +%Y%m%d_%H%M%S)"
[ -L "$CONFIG_DIR/zellij" ] && rm "$CONFIG_DIR/zellij"
ln -s "$DOTFILES_DIR/zellij" "$CONFIG_DIR/zellij"
echo "✓ Zellij instalado"
