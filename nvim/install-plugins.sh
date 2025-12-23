#!/usr/bin/env bash

# Script para instalar plugins de LazyVim
# Ejecutar después de abrir Neovim por primera vez

echo "Instalando plugins de LazyVim..."
nvim --headless "+Lazy! sync" +qa

echo "✅ Instalación completada!"
echo ""
echo "Ahora puedes abrir Neovim con: nvim"
echo "Y probar Cursor Agent con: <leader>aa (para abrir el chat)"



