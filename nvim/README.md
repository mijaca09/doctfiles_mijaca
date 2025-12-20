# Neovim Configuration (LazyVim)

Configuración de Neovim basada en LazyVim con personalizaciones.

## 🎨 Características

- **Distribución**: LazyVim
- **Tema**: Tokyo Night con transparencia
- **Transparencia**: Activada para ver fondo de terminal
- **Clipboard**: Configurado para copiar al sistema con `Ctrl+C` o `<leader>y`
- **LSP**: Configurado automáticamente por LazyVim
- **Plugins**: Gestión automática con lazy.nvim

## 🚀 Instalación

```bash
# Clonar este repo
git clone git@github.com:mijaca09/dotfiles-nvim.git ~/.config/nvim

# O usando el script de instalación del repo principal
cd ~/Code/mijaca09/dotfiles/.dotfiles-meta
./install-nvim.sh

# Abrir nvim para instalar plugins
nvim
```

## ⌨️ Atajos Personalizados

### Copiar/Pegar

- `Ctrl+C` (modo visual): Copiar al portapapeles del sistema
- `<leader>y` (modo normal): Copiar línea actual al portapapeles
- `<leader>y` (modo visual): Copiar selección al portapapeles
- `<leader>p`: Pegar desde portapapeles

### Navegación

- `<leader>ff`: Buscar archivos (Telescope)
- `<leader>fg`: Buscar en archivos (Grep)
- `<leader>e`: Toggle explorador de archivos

## 📁 Estructura

```
nvim/
├── init.lua              # Punto de entrada
├── lua/
│   ├── config/
│   │   ├── lazy.lua      # Configuración de lazy.nvim
│   │   ├── options.lua   # Opciones de nvim
│   │   ├── keymaps.lua   # Atajos personalizados
│   │   └── autocmds.lua  # Autocommands
│   └── plugins/
│       ├── transparent-bg.lua  # Plugin de transparencia
│       ├── avante.lua          # Plugin Avante
│       └── example.lua         # Ejemplos de LazyVim
├── lazy-lock.json        # Versiones fijas de plugins
└── README.md             # Este archivo
```

## 🎨 Temas

### Actual: Tokyo Night (transparente)

Configurado en `lua/plugins/transparent-bg.lua`

## 🔧 Personalizar

### Agregar nuevo plugin

1. Crear archivo en `lua/plugins/`
2. Estructura básica:

```lua
return {
  "usuario/nombre-plugin",
  opts = {
    -- opciones
  },
}
```

### Cambiar atajos

Editar `lua/config/keymaps.lua`

### Cambiar opciones

Editar `lua/config/options.lua`

## 📚 Documentación

- **LazyVim**: https://www.lazyvim.org/
- **Neovim**: https://neovim.io/doc/

## 🐛 Problemas Conocidos

Ninguno actualmente.

---

Parte del sistema de dotfiles: [mijaca09/dotfiles](https://github.com/mijaca09/dotfiles)
