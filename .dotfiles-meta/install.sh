#!/bin/bash
# Script de instalación completa de dotfiles mijaca09

set -e

echo "=========================================="
echo "  Instalación de Dotfiles - mijaca09"
echo "=========================================="

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

DOTFILES_DIR="$HOME/Code/mijaca09/dotfiles"
CONFIG_DIR="$HOME/.config"

# --- DEPENDENCIAS ---
echo -e "${YELLOW}📦 Instalando dependencias del sistema...${NC}"
sudo apt update
sudo apt install -y waybar rofi hyprpaper tmux brightnessctl pulseaudio-utils nm-tray network-manager kitty nvim yazi starship git bc curl

# --- FUENTES ---
echo -e "${YELLOW}󰛖 Instalando Iosevka Nerd Font...${NC}"
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"
if [ ! -f "$FONT_DIR/Iosevka.zip" ]; then
    curl -L -o "$FONT_DIR/Iosevka.zip" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Iosevka.zip"
    unzip -o "$FONT_DIR/Iosevka.zip" -d "$FONT_DIR"
    fc-cache -fv
    echo -e "${GREEN}✓ Fuente Iosevka instalada.${NC}"
fi

# --- FUNCIONES ---
create_backup() {
    local target=$1
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        mv "$target" "${target}.backup.$(date +%Y%m%d_%H%M%S)"
    fi
}

create_symlink() {
    local source=$1
    local target=$2
    [ -L "$target" ] && rm "$target"
    ln -s "$source" "$target"
    echo -e "${GREEN}→ Link: $target${NC}"
}

echo -e "${YELLOW}🔗 Creando enlaces simbólicos...${NC}"
mkdir -p "$CONFIG_DIR"

# Lista de configuraciones a linkear
configs=("hypr" "waybar" "kitty" "nvim" "yazi" "rofi" "wifimenu" "tmux")

for cfg in "${configs[@]}"; do
    if [ -d "$DOTFILES_DIR/$cfg" ]; then
        create_backup "$CONFIG_DIR/$cfg"
        create_symlink "$DOTFILES_DIR/$cfg" "$CONFIG_DIR/$cfg"
    fi
done

# Tmux config especial
create_backup "$HOME/.tmux.conf"
ln -s "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"

# Starship config especial
create_backup "$CONFIG_DIR/starship.toml"
ln -s "$DOTFILES_DIR/starship/starship.toml" "$CONFIG_DIR/starship.toml"

echo "=========================================="
echo -e "${GREEN}✓ ¡Proceso terminado con éxito!${NC}"
echo "=========================================="
