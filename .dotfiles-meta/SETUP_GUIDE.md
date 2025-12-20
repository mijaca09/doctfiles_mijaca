# 📘 Guía de Configuración de Dotfiles

Esta guía te explica paso a paso cómo funciona y cómo usar este sistema de dotfiles.

---

## 🎯 ¿Qué es esto?

Un sistema automatizado de backup y sincronización de tus archivos de configuración (dotfiles) usando Git y GitHub.

### Ventajas:
- ✅ **Backup automático** de todas tus configuraciones
- ✅ **Restauración rápida** en cualquier máquina nueva
- ✅ **Versionado** completo de cambios
- ✅ **Modular**: Instala solo lo que necesites
- ✅ **Sincronización bidireccional** automática

---

## 📂 Estructura

```
~/Code/mijaca09/dotfiles/
├── hypr/          → Symlink ← ~/.config/hypr/
├── waybar/        → Symlink ← ~/.config/waybar/
├── kitty/         → Symlink ← ~/.config/kitty/
├── nvim/          → Symlink ← ~/.config/nvim/
├── yazi/          → Symlink ← ~/.config/yazi/
├── starship/      → Symlink ← ~/.config/starship.toml
└── .dotfiles-meta/
    └── Scripts de instalación y sincronización
```

**Importante**: Los archivos reales están en `~/Code/mijaca09/dotfiles/`, y `~/.config/` contiene symlinks.

---

## 🚀 Instalación Completa (Máquina Nueva)

### Paso 1: Clonar el repositorio

```bash
cd ~/Code/mijaca09
git clone --recursive git@github.com:mijaca09/dotfiles.git
cd dotfiles/.dotfiles-meta
```

### Paso 2: Ejecutar instalación completa

```bash
chmod +x install.sh
./install.sh
```

Esto instalará:
- Hyprland config
- Waybar config
- Kitty config
- Neovim config (LazyVim)
- Yazi config
- Starship config

### Paso 3: Reiniciar sesión

```bash
# Recargar .bashrc
source ~/.bashrc

# O reiniciar terminal
```

---

## 🔧 Instalación Individual

Si solo quieres instalar un dotfile específico:

### Neovim
```bash
cd ~/Code/mijaca09/dotfiles/.dotfiles-meta
./install-nvim.sh
```

### Kitty
```bash
cd ~/Code/mijaca09/dotfiles/.dotfiles-meta
./install-kitty.sh
```

### Yazi
```bash
cd ~/Code/mijaca09/dotfiles/.dotfiles-meta
./install-yazi.sh
```

### Hyprland
```bash
cd ~/Code/mijaca09/dotfiles/.dotfiles-meta
./install-hypr.sh
```

### Waybar
```bash
cd ~/Code/mijaca09/dotfiles/.dotfiles-meta
./install-waybar.sh
```

### Starship
```bash
cd ~/Code/mijaca09/dotfiles/.dotfiles-meta
./install-starship.sh
```

---

## 🔄 Flujo de Trabajo Diario

### Escenario 1: Modificar configuración

```bash
# 1. Edita tu config normalmente
nvim ~/.config/nvim/lua/config/keymaps.lua

# 2. El cambio se refleja automáticamente en el repo
#    (porque es un symlink)

# 3. Haz commit y push
cd ~/Code/mijaca09/dotfiles/nvim
git add .
git commit -m "Update keymaps"
git push

# 4. El repo principal se actualiza automáticamente (git hook)
```

### Escenario 2: Actualizar desde GitHub

```bash
# Si hiciste cambios en otra máquina y quieres traerlos
cd ~/Code/mijaca09/dotfiles
git pull
git submodule update --remote --merge
```

### Escenario 3: Ver qué cambió

```bash
cd ~/Code/mijaca09/dotfiles/nvim
git status
git diff
git log
```

---

## 📝 Agregar un Nuevo Dotfile

### Paso 1: Crear estructura

```bash
cd ~/Code/mijaca09/dotfiles
mkdir mi-nuevo-dotfile
cp -r ~/.config/mi-nuevo-dotfile/* ./mi-nuevo-dotfile/
```

### Paso 2: Crear repo en GitHub

```bash
# En GitHub, crea el repo: dotfiles-mi-nuevo-dotfile
```

### Paso 3: Inicializar Git

```bash
cd mi-nuevo-dotfile
git init
git add .
git commit -m "Initial commit"
git remote add origin git@github.com:mijaca09/dotfiles-mi-nuevo-dotfile.git
git push -u origin main
```

### Paso 4: Agregar como submodule al repo principal

```bash
cd ~/Code/mijaca09/dotfiles
git submodule add git@github.com:mijaca09/dotfiles-mi-nuevo-dotfile.git mi-nuevo-dotfile
git commit -m "Add mi-nuevo-dotfile submodule"
git push
```

### Paso 5: Crear symlink

```bash
# Backup del original
mv ~/.config/mi-nuevo-dotfile ~/.config/mi-nuevo-dotfile.backup

# Crear symlink
ln -s ~/Code/mijaca09/dotfiles/mi-nuevo-dotfile ~/.config/mi-nuevo-dotfile
```

### Paso 6: Crear script de instalación

```bash
cd ~/Code/mijaca09/dotfiles/.dotfiles-meta
# Copia y modifica uno de los scripts existentes
cp install-nvim.sh install-mi-nuevo-dotfile.sh
# Edita el script según necesites
```

---

## 🛠️ Comandos Útiles

### Ver estado de todos los submodules

```bash
cd ~/Code/mijaca09/dotfiles
git submodule status
```

### Actualizar todos los submodules

```bash
cd ~/Code/mijaca09/dotfiles
git submodule update --remote --merge
git add .
git commit -m "Update all submodules"
git push
```

### Ver diferencias en submodule específico

```bash
cd ~/Code/mijaca09/dotfiles/nvim
git diff
git log --oneline
```

### Restaurar un dotfile específico

```bash
cd ~/Code/mijaca09/dotfiles/nvim
git checkout .  # Descarta cambios locales
git pull        # Obtiene última versión
```

### Eliminar un dotfile

```bash
# 1. Eliminar submodule
cd ~/Code/mijaca09/dotfiles
git submodule deinit -f nvim
git rm -f nvim
git commit -m "Remove nvim dotfile"

# 2. Eliminar symlink
rm ~/.config/nvim

# 3. Opcional: Restaurar backup
mv ~/.config/nvim.backup ~/.config/nvim
```

---

## 🐛 Solución de Problemas

### Problema: Symlink roto

**Síntoma**: Al abrir una app, no encuentra la config

**Solución**:
```bash
# Verificar symlink
ls -la ~/.config/nvim

# Recrear symlink
rm ~/.config/nvim
ln -s ~/Code/mijaca09/dotfiles/nvim ~/.config/nvim
```

### Problema: Git push falla

**Síntoma**: `Permission denied (publickey)`

**Solución**:
```bash
# Verificar que estás en ~/Code/mijaca09/
pwd

# Verificar SSH
ssh -i ~/Code/mijaca09/mijaca09 -T git@github.com

# Verificar git config
git config user.name    # Debe ser: mijaca09
git config user.email   # Debe ser: mijaca09@gmail.com
```

### Problema: Submodule desactualizado

**Síntoma**: Cambios no se reflejan en repo principal

**Solución**:
```bash
cd ~/Code/mijaca09/dotfiles
git submodule update --remote --merge
git add .
git commit -m "Update submodules"
git push
```

### Problema: Conflicto de merge

**Síntoma**: Git reporta conflictos

**Solución**:
```bash
# Ver archivos en conflicto
git status

# Opción 1: Aceptar cambios remotos
git checkout --theirs archivo-en-conflicto

# Opción 2: Mantener cambios locales
git checkout --ours archivo-en-conflicto

# Opción 3: Resolver manualmente
nvim archivo-en-conflicto
# Edita, busca <<<<<<, ======, >>>>>>

# Finalizar merge
git add .
git commit -m "Resolve merge conflicts"
git push
```

---

## 📚 Recursos Adicionales

### Documentación Git Submodules
- https://git-scm.com/book/en/v2/Git-Tools-Submodules

### Documentación Symlinks
- https://man7.org/linux/man-pages/man1/ln.1.html

### Dotfiles de inspiración
- https://github.com/thoughtbot/dotfiles
- https://github.com/mathiasbynens/dotfiles
- https://dotfiles.github.io/

---

## ✅ Checklist de Verificación

Después de instalar, verifica:

- [ ] Hyprland inicia correctamente
- [ ] Waybar se muestra con tu configuración
- [ ] Kitty tiene transparencia 85%
- [ ] Neovim carga LazyVim con transparencia
- [ ] Yazi abre archivos con nvim
- [ ] Starship muestra prompt Tokyo Night
- [ ] Git config correcto en `~/Code/mijaca09/`
- [ ] Puedes hacer push a GitHub
- [ ] Symlinks funcionan correctamente

---

## 🆘 Obtener Ayuda

Si algo no funciona:

1. **Lee** el archivo `AI_CONTEXT.md`
2. **Revisa** esta guía
3. **Verifica** logs de error
4. **Comprueba** permisos y rutas
5. **Pregunta** a la IA con contexto completo

---

*Última actualización: 2024-12-19*
