# Contexto de Dotfiles para IA

## 📋 Información General

### Usuario
- **Nombre**: mijaca09
- **Email**: mijaca09@gmail.com
- **GitHub**: mijaca09
- **Sistema**: Linux (Arch-based)
- **Shell**: Bash
- **Terminal**: Kitty

### Ubicación de Dotfiles
- **Repositorio local**: `~/Code/mijaca09/dotfiles/`
- **Configuración del sistema**: `~/.config/`
- **Clave SSH**: `~/Code/mijaca09/mijaca09` (privada) y `~/Code/mijaca09/mijaca09.pub` (pública)

---

## 🗂️ Estructura del Proyecto

```
~/Code/mijaca09/dotfiles/
├── hypr/              # Configuración de Hyprland (window manager)
├── waybar/            # Configuración de Waybar (barra de estado)
├── kitty/             # Configuración de Kitty (terminal)
├── nvim/              # Configuración de Neovim con LazyVim
├── yazi/              # Configuración de Yazi (file manager)
├── zellij/            # Configuración de Zellij (terminal multiplexer)
├── starship/          # Configuración de Starship (prompt)
└── .dotfiles-meta/    # Metadatos, scripts y contexto para IA
    ├── AI_CONTEXT.md          # Este archivo
    ├── SETUP_GUIDE.md         # Guía de configuración
    ├── install.sh             # Script de instalación completo
    ├── install-hypr.sh        # Script individual para hypr
    ├── install-waybar.sh      # Script individual para waybar
    ├── install-kitty.sh       # Script individual para kitty
    ├── install-nvim.sh        # Script individual para nvim
    ├── install-yazi.sh        # Script individual para yazi
    ├── install-starship.sh    # Script individual para starship
    └── sync-dotfiles.sh       # Script de sincronización
```

---

## 🔄 Sistema de Sincronización

### Funcionamiento

1. **Symlinks**: Los archivos en `~/.config/` son symlinks que apuntan a `~/Code/mijaca09/dotfiles/X/`
2. **Git Submodules**: Cada dotfile es un submódulo del repo principal `dotfiles`
3. **Git Hooks**: Al hacer push en repo individual, se actualiza automáticamente el repo principal
4. **Automatización**: Los cambios en el sistema se reflejan automáticamente en los repos

### Flujo de Trabajo

```
1. Usuario modifica archivo → ~/.config/nvim/lua/config/keymaps.lua
                              (es un symlink)
                              ↓
2. Cambio se refleja en    → ~/Code/mijaca09/dotfiles/nvim/lua/config/keymaps.lua
                              ↓
3. Usuario hace commit     → cd ~/Code/mijaca09/dotfiles/nvim
                              git add .
                              git commit -m "Update keymaps"
                              git push
                              ↓
4. Git Hook automático     → Actualiza repo dotfiles principal
                              Actualiza submodule reference
                              Push automático al repo principal
```

---

## 📦 Repositorios GitHub

### Repo Principal
- **Nombre**: `dotfiles`
- **URL**: `git@github.com:mijaca09/dotfiles.git`
- **Contenido**: Todos los dotfiles como submodules + scripts de instalación

### Repos Individuales
1. **dotfiles-hypr** - `git@github.com:mijaca09/dotfiles-hypr.git`
2. **dotfiles-waybar** - `git@github.com:mijaca09/dotfiles-waybar.git`
3. **dotfiles-kitty** - `git@github.com:mijaca09/dotfiles-kitty.git`
4. **dotfiles-nvim** - `git@github.com:mijaca09/dotfiles-nvim.git`
5. **dotfiles-yazi** - `git@github.com:mijaca09/dotfiles-yazi.git`
6. **dotfiles-zellij** - `git@github.com:mijaca09/dotfiles-zellij.git`
7. **dotfiles-starship** - `git@github.com:mijaca09/dotfiles-starship.git`

---

## 🛠️ Configuraciones Específicas

### Hyprland
- **Ubicación**: `~/.config/hypr/`
- **Archivo principal**: `hyprland.conf`
- **Descripción**: Window manager de Wayland

### Waybar
- **Ubicación**: `~/.config/waybar/`
- **Archivos**: `config`, `style.css`
- **Descripción**: Barra de estado personalizable para Wayland

### Kitty
- **Ubicación**: `~/.config/kitty/`
- **Archivo**: `kitty.conf`
- **Características**:
  - Transparencia: 85% (`background_opacity 0.85`)
  - Blur activado
  - Tema: Tokyo Night

### Neovim
- **Ubicación**: `~/.config/nvim/`
- **Distribución**: LazyVim
- **Características**:
  - Tema: Tokyo Night con transparencia
  - Plugins personalizados en `lua/plugins/`
  - Configuración de transparencia en `lua/plugins/transparent-bg.lua`
  - Keymaps personalizados en `lua/config/keymaps.lua`
  - Copiar al portapapeles: `Ctrl+C` en modo visual o `<leader>y`

### Yazi
- **Ubicación**: `~/.config/yazi/`
- **Archivos**: `yazi.toml`, `keymap.toml`, `theme.toml`
- **Características**:
  - Editor configurado: nvim con LazyVim
  - Tema: Flexoki Dark (intento, puede necesitar ajustes)
  - Flavors instalados: Catppuccin Mocha, Catppuccin Frappe, Dracula

### Zellij
- **Ubicación**: `~/.config/zellij/`
- **Archivo**: `config.kdl`
- **Descripción**: Terminal multiplexer (alternativa a tmux)
- **Versión**: 0.43.1
- **Características**:
  - Soporte de tabs y panes
  - Mouse activado
  - Editor configurado: nvim

### Starship
- **Ubicación**: `~/.config/starship.toml`
- **Preset**: Tokyo Night
- **Inicialización**: En `.bashrc` con `eval "$(starship init bash)"`

---

## 🔑 Configuración Git/SSH

### Git Config Global (`~/.gitconfig`)
```toml
[user]
    name = mijaca
    email = mijaca@ejemplo.com

[init]
    defaultBranch = main

# Configuración específica para proyectos mijaca09
[includeIf "gitdir:/home/mijaca/Code/mijaca09/"]
    path = /home/mijaca/Code/mijaca09/.gitconfig
```

### Git Config Local (`~/Code/mijaca09/.gitconfig`)
```toml
[user]
    name = mijaca09
    email = mijaca09@gmail.com

[core]
    sshCommand = /usr/bin/ssh -i /home/mijaca/Code/mijaca09/mijaca09

[init]
    defaultBranch = main
```

### Clave SSH
- **Privada**: `~/Code/mijaca09/mijaca09`
- **Pública**: `~/Code/mijaca09/mijaca09.pub`
- **Uso**: Solo para repos dentro de `~/Code/mijaca09/`
- **Agregada a GitHub**: Cuenta mijaca09

### Alias Bash
```bash
alias git_mijaca09="source ~/Code/mijaca09/git_mijaca09_credentials.sh"
```

---

## 📝 Variables de Entorno (.bashrc)

### Editor
```bash
export EDITOR="nvim"
export VISUAL="nvim"
```

### Starship
```bash
eval "$(starship init bash)"
```

### Brew
```bash
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

---

## 🚀 Comandos Útiles

### Verificar configuración Git actual
```bash
git config user.name
git config user.email
git config core.sshCommand
```

### Probar conexión SSH a GitHub
```bash
ssh -i ~/Code/mijaca09/mijaca09 -T git@github.com
```

### Sincronizar dotfiles
```bash
cd ~/Code/mijaca09/dotfiles
./sync-dotfiles.sh
```

### Instalar dotfiles en máquina nueva
```bash
# Clonar repo principal
cd ~/Code/mijaca09
git clone --recursive git@github.com:mijaca09/dotfiles.git

# Ejecutar instalación completa
cd dotfiles/.dotfiles-meta
./install.sh

# O instalar individual
./install-nvim.sh
```

### Actualizar submodules
```bash
cd ~/Code/mijaca09/dotfiles
git submodule update --remote --merge
```

---

## 🎯 Objetivos del Sistema de Dotfiles

1. ✅ **Backup automático**: Cada cambio se guarda en GitHub
2. ✅ **Portabilidad**: Restaurar config completa en cualquier máquina
3. ✅ **Modularidad**: Cada dotfile es independiente
4. ✅ **Sincronización bidireccional**: Sistema ↔ GitHub automático
5. ✅ **Versionado**: Historial completo de cambios
6. ✅ **Flexibilidad**: Instalar dotfiles completos o individuales

---

## 🔧 Problemas Conocidos y Soluciones

### Yazi - Tema no se aplica
**Problema**: El tema personalizado Flexoki Dark no se muestra
**Soluciones intentadas**:
- Creado `theme.toml` con estructura oficial de yazi
- Desactivado flavors con `use = ""`
- Limpiada caché con `yazi --clear-cache`

**Estado**: Pendiente de resolver
**Archivos relacionados**: `~/.config/yazi/theme.toml`, `~/.config/yazi/yazi.toml`

### Neovim - Transparencia
**Problema**: Configurar transparencia para ver fondo de terminal
**Solución**: Plugin en `lua/plugins/transparent-bg.lua`
**Estado**: ✅ Funcionando

### Copiar al portapapeles del sistema
**Problema**: No podía copiar texto de nvim al sistema
**Solución**: Keymaps en `lua/config/keymaps.lua` - `Ctrl+C` en visual o `<leader>y`
**Estado**: ✅ Funcionando

---

## 📚 Contexto de Conversaciones Previas

### Temas Trabajados
1. ✅ Configuración inicial de yazi
2. ✅ Instalación y configuración de temas (Flexoki Dark, Tokyo Night)
3. ✅ Configuración de Starship prompt
4. ✅ Transparencia en Kitty terminal (85%)
5. ✅ Transparencia en Neovim
6. ✅ Configuración de copiar/pegar al portapapeles del sistema
7. ✅ Configuración de claves SSH por carpeta (Git conditional includes)
8. 🔄 Setup de dotfiles con Git Submodules (EN PROGRESO)

### Preferencias del Usuario
- **Temas**: Tokyo Night, Flexoki Dark
- **Estilo**: Minimalista, transparencias, colores vibrantes
- **Workflow**: Automatización máxima, scripts de instalación
- **Backup**: Sistema robusto de dotfiles con GitHub

---

## 🤖 Instrucciones para IA

### Al continuar esta conversación:

1. **Leer este contexto completo** antes de responder
2. **Ubicación actual**: Trabajando en `~/Code/mijaca09/dotfiles/`
3. **Cuenta Git activa**: mijaca09 (solo en esta carpeta)
4. **No modificar** archivos fuera de `~/Code/mijaca09/` sin permiso
5. **Mantener actualizado** este archivo `AI_CONTEXT.md` con nuevos cambios
6. **Crear backups** antes de modificaciones importantes
7. **Usar rutas absolutas** en configs: `/home/mijaca/...`
8. **Probar comandos** antes de confirmar que funcionan

### Comandos que SIEMPRE debes verificar:
- Rutas de archivos (usar absolutas cuando sea necesario)
- Permisos de archivos SSH (600 para privadas, 644 para públicas)
- Symlinks (verificar que apunten correctamente)
- Git config (verificar user.name, user.email, core.sshCommand)

### Preguntas frecuentes esperadas:
- ¿Cómo agrego un nuevo dotfile?
- ¿Cómo restauro en máquina nueva?
- ¿Cómo actualizo todos los dotfiles?
- ¿Cómo revierto cambios?
- ¿Cómo resuelvo conflictos de sincronización?

---

## 📅 Última Actualización

- **Fecha**: 2024-12-19
- **Estado**: Dotfiles copiados, estructura creada, pendiente crear repos y scripts
- **Próximos pasos**:
  1. Crear repos en GitHub
  2. Inicializar Git en cada dotfile
  3. Crear scripts de instalación
  4. Configurar Git Hooks
  5. Crear symlinks
  6. Probar sincronización

---

## 📞 Contacto

- **GitHub**: @mijaca09
- **Email**: mijaca09@gmail.com

---

*Este archivo debe actualizarse cada vez que se hagan cambios significativos en la configuración.*
