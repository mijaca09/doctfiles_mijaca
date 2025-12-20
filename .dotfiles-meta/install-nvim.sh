#!/bin/bash
set -e
echo "Instalando configuración de Neovim (LazyVim)..."
DOTFILES_DIR="$HOME/Code/mijaca09/dotfiles"
CONFIG_DIR="$HOME/.config"
[ -e "$CONFIG_DIR/nvim" ] && [ ! -L "$CONFIG_DIR/nvim" ] && mv "$CONFIG_DIR/nvim" "$CONFIG_DIR/nvim.backup.$(date +%Y%m%d_%H%M%S)"
[ -L "$CONFIG_DIR/nvim" ] && rm "$CONFIG_DIR/nvim"
ln -s "$DOTFILES_DIR/nvim" "$CONFIG_DIR/nvim"
echo "✓ Neovim instalado. Abre nvim para sincronizar plugins"
