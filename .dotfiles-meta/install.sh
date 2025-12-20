#!/bin/bash
# Script de instalación completa de dotfiles mijaca09
# Este script instala todos los dotfiles y crea los symlinks necesarios

set -e  # Detener en caso de error

echo "=========================================="
echo "  Instalación de Dotfiles - mijaca09"
echo "=========================================="
echo ""

# Colores para output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Directorio base
DOTFILES_DIR="$HOME/Code/mijaca09/dotfiles"
CONFIG_DIR="$HOME/.config"

# Función para crear backup
create_backup() {
    local config_name=$1
    local target_path=$2
    
    if [ -e "$target_path" ] && [ ! -L "$target_path" ]; then
        echo -e "${YELLOW}⚠ Creando backup de $config_name...${NC}"
        mv "$target_path" "${target_path}.backup.$(date +%Y%m%d_%H%M%S)"
        echo -e "${GREEN}✓ Backup creado${NC}"
    fi
}

# Función para crear symlink
create_symlink() {
    local source=$1
    local target=$2
    local name=$3
    
    if [ -L "$target" ]; then
        echo -e "${YELLOW}⚠ Symlink ya existe para $name, eliminando...${NC}"
        rm "$target"
    fi
    
    echo -e "${GREEN}→ Creando symlink para $name...${NC}"
    ln -s "$source" "$target"
    echo -e "${GREEN}✓ Symlink creado: $target → $source${NC}"
}

echo "Instalando dotfiles..."
echo ""

# Verificar que estamos en el directorio correcto
if [ ! -d "$DOTFILES_DIR" ]; then
    echo -e "${RED}✗ Error: No se encuentra el directorio $DOTFILES_DIR${NC}"
    exit 1
fi

# Crear directorio .config si no existe
mkdir -p "$CONFIG_DIR"

# Instalar Hyprland
if [ -d "$DOTFILES_DIR/hypr" ]; then
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  Instalando Hyprland"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    create_backup "Hyprland" "$CONFIG_DIR/hypr"
    create_symlink "$DOTFILES_DIR/hypr" "$CONFIG_DIR/hypr" "Hyprland"
    echo ""
fi

# Instalar Waybar
if [ -d "$DOTFILES_DIR/waybar" ]; then
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  Instalando Waybar"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    create_backup "Waybar" "$CONFIG_DIR/waybar"
    create_symlink "$DOTFILES_DIR/waybar" "$CONFIG_DIR/waybar" "Waybar"
    echo ""
fi

# Instalar Kitty
if [ -d "$DOTFILES_DIR/kitty" ]; then
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  Instalando Kitty"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    create_backup "Kitty" "$CONFIG_DIR/kitty"
    create_symlink "$DOTFILES_DIR/kitty" "$CONFIG_DIR/kitty" "Kitty"
    echo ""
fi

# Instalar Neovim
if [ -d "$DOTFILES_DIR/nvim" ]; then
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  Instalando Neovim"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    create_backup "Neovim" "$CONFIG_DIR/nvim"
    create_symlink "$DOTFILES_DIR/nvim" "$CONFIG_DIR/nvim" "Neovim"
    echo ""
fi

# Instalar Yazi
if [ -d "$DOTFILES_DIR/yazi" ]; then
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  Instalando Yazi"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    create_backup "Yazi" "$CONFIG_DIR/yazi"
    create_symlink "$DOTFILES_DIR/yazi" "$CONFIG_DIR/yazi" "Yazi"
    echo ""
fi

# Instalar Starship
if [ -f "$DOTFILES_DIR/starship/starship.toml" ]; then
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  Instalando Starship"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    create_backup "Starship" "$CONFIG_DIR/starship.toml"
    create_symlink "$DOTFILES_DIR/starship/starship.toml" "$CONFIG_DIR/starship.toml" "Starship"
    echo ""
fi

echo "=========================================="
echo -e "${GREEN}✓ Instalación completada!${NC}"
echo "=========================================="
echo ""
echo "Próximos pasos:"
echo "1. Reinicia tu sesión o recarga .bashrc:"
echo "   source ~/.bashrc"
echo ""
echo "2. Verifica que los symlinks funcionan:"
echo "   ls -la ~/.config/"
echo ""
echo "3. Reinicia tus aplicaciones para que carguen la nueva config"
echo ""
echo "4. Los backups de tus configs anteriores están en:"
echo "   ~/.config/*.backup.*"
echo ""
echo "¡Disfruta tus dotfiles! 🎉"

# Instalar Zellij
if [ -d "$DOTFILES_DIR/zellij" ]; then
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  Instalando Zellij"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    create_backup "Zellij" "$CONFIG_DIR/zellij"
    create_symlink "$DOTFILES_DIR/zellij" "$CONFIG_DIR/zellij" "Zellij"
    echo ""
fi
