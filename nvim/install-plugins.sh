#!/usr/bin/env bash

# Script para instalar plugins de LazyVim y compilar Avante
# Ejecutar después de abrir Neovim por primera vez

echo "Instalando plugins de LazyVim..."
nvim --headless "+Lazy! sync" +qa

echo "Compilando Avante.nvim..."
cd ~/.local/share/nvim/lazy/avante.nvim 2>/dev/null && make || echo "Avante se compilará automáticamente al usarlo por primera vez"

echo "✅ Instalación completada!"
echo ""
echo "Ahora puedes abrir Neovim con: nvim"
echo "Y probar Avante con: :AvanteChat"

