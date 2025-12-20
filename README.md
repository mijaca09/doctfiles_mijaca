# 🎨 Dotfiles de mijaca09

Configuración completa del sistema con sincronización automática a GitHub.

## 📸 Preview

- **WM**: Hyprland
- **Bar**: Waybar
- **Terminal**: Kitty (transparencia 85%)
- **Editor**: Neovim (LazyVim) con transparencia
- **File Manager**: Yazi
- **Prompt**: Starship (Tokyo Night)
- **Tema**: Tokyo Night / Flexoki Dark

## 🚀 Instalación Rápida

```bash
# Clonar con submodules
git clone --recursive git@github.com:mijaca09/dotfiles.git ~/Code/mijaca09/dotfiles

# Instalar todo
cd ~/Code/mijaca09/dotfiles/.dotfiles-meta
./install.sh

# Recargar shell
source ~/.bashrc
```

## 📦 Dotfiles Incluidos

| Aplicación | Descripción | Instalación Individual |
|-----------|-------------|----------------------|
| **Hyprland** | Window Manager | `./install-hypr.sh` |
| **Waybar** | Status Bar | `./install-waybar.sh` |
| **Kitty** | Terminal Emulator | `./install-kitty.sh` |
| **Neovim** | Editor (LazyVim) | `./install-nvim.sh` |
| **Yazi** | File Manager | `./install-yazi.sh` |
| **Zellij** | Terminal Multiplexer | `./install-zellij.sh` |
| **Starship** | Shell Prompt | `./install-starship.sh` |

## 🔄 Flujo de Trabajo

### Modificar configuración

```bash
# 1. Edita normalmente
nvim ~/.config/nvim/lua/config/keymaps.lua

# 2. Commit y push
cd ~/Code/mijaca09/dotfiles/nvim
git add .
git commit -m "Update keymaps"
git push

# 3. El repo principal se actualiza automáticamente
```

### Actualizar desde GitHub

```bash
cd ~/Code/mijaca09/dotfiles
git pull
git submodule update --remote --merge
```

## 📁 Estructura

```
dotfiles/
├── hypr/              # Configuración de Hyprland
├── waybar/            # Configuración de Waybar
├── kitty/             # Configuración de Kitty
├── nvim/              # Configuración de Neovim (LazyVim)
├── yazi/              # Configuración de Yazi
├── zellij/            # Configuración de Zellij
├── starship/          # Configuración de Starship
└── .dotfiles-meta/    # Scripts y documentación
    ├── AI_CONTEXT.md          # Contexto completo para IA
    ├── SETUP_GUIDE.md         # Guía detallada
    ├── install.sh             # Instalación completa
    └── install-*.sh           # Instalaciones individuales
```

## 🎯 Características

- ✅ **Backup automático** en GitHub
- ✅ **Versionado completo** de cambios
- ✅ **Instalación modular** (todo o individual)
- ✅ **Symlinks automáticos** a `~/.config/`
- ✅ **Sincronización bidireccional**
- ✅ **Scripts de instalación** para cada dotfile
- ✅ **Portabilidad** total entre máquinas

## 🔑 Requisitos

- **Git** con SSH configurado
- **Bash** shell
- Aplicaciones que quieras configurar (hyprland, kitty, nvim, etc.)

## 📚 Documentación

- **[AI_CONTEXT.md](.dotfiles-meta/AI_CONTEXT.md)**: Contexto completo del sistema
- **[SETUP_GUIDE.md](.dotfiles-meta/SETUP_GUIDE.md)**: Guía paso a paso

## 🛠️ Comandos Útiles

```bash
# Ver estado de todos los dotfiles
cd ~/Code/mijaca09/dotfiles
git submodule status

# Actualizar todos
git submodule update --remote --merge

# Ver diferencias
cd ~/Code/mijaca09/dotfiles/nvim
git diff

# Verificar symlinks
ls -la ~/.config/
```

## 🐛 Problemas Comunes

### Symlink roto
```bash
rm ~/.config/nvim
ln -s ~/Code/mijaca09/dotfiles/nvim ~/.config/nvim
```

### Git push falla
```bash
# Verificar SSH
ssh -i ~/Code/mijaca09/mijaca09 -T git@github.com

# Verificar config
cd ~/Code/mijaca09/dotfiles/nvim
git config user.name    # Debe ser: mijaca09
git config user.email   # Debe ser: mijaca09@gmail.com
```

## 💡 Tips

- Haz commits frecuentes y descriptivos
- Prueba cambios antes de pushear
- Usa branches para experimentos
- Mantén backups de configs importantes

## 📝 To-Do

- [ ] Resolver tema Flexoki Dark en Yazi
- [ ] Agregar dotfile para Bash
- [ ] Agregar dotfile para Git
- [ ] Crear GitHub Actions para CI/CD
- [ ] Agregar screenshots

## 📄 Licencia

MIT License - Libre de usar y modificar

## 🙏 Créditos

- **LazyVim**: https://www.lazyvim.org/
- **Tokyo Night Theme**: https://github.com/tokyo-night
- **Flexoki Theme**: https://stephango.com/flexoki
- **Starship**: https://starship.rs/

---

**Autor**: mijaca09  
**Email**: mijaca09@gmail.com  
**GitHub**: [@mijaca09](https://github.com/mijaca09)

---

*Si encuentras útil esta configuración, dale una ⭐!*
