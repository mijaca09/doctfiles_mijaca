# 📋 Próximos Pasos - Configuración de Dotfiles

## ✅ Lo que ya está hecho

1. ✅ Estructura de carpetas creada
2. ✅ Dotfiles copiados desde `~/.config/`
3. ✅ Scripts de instalación creados (completo + individuales)
4. ✅ Documentación completa (AI_CONTEXT.md, SETUP_GUIDE.md)
5. ✅ READMEs para cada dotfile
6. ✅ README principal del proyecto

## 🚀 Pasos pendientes (EN ORDEN)

### Paso 1: Crear repositorios en GitHub

Necesitas crear estos 8 repositorios en GitHub (cuenta: mijaca09):

1. `dotfiles` (principal - contendrá los demás como submodules)
2. `dotfiles-hypr`
3. `dotfiles-waybar`
4. `dotfiles-kitty`
5. `dotfiles-nvim`
6. `dotfiles-yazi`
7. `dotfiles-zellij`
8. `dotfiles-starship`

**Cómo crearlos:**
1. Ve a: https://github.com/new
2. Repository name: `dotfiles` (y luego los demás)
3. Description: (opcional) "My dotfiles"
4. Public o Private: Tu elección
5. **NO inicialices con README** (ya los tienes)
6. Click "Create repository"

### Paso 2: Inicializar Git en cada dotfile

```bash
cd ~/Code/mijaca09/dotfiles

# Hypr
cd hypr
git init
git add .
git commit -m "Initial commit: Hyprland configuration"
git branch -M main
git remote add origin git@github.com:mijaca09/dotfiles-hypr.git
git push -u origin main
cd ..

# Waybar
cd waybar
git init
git add .
git commit -m "Initial commit: Waybar configuration"
git branch -M main
git remote add origin git@github.com:mijaca09/dotfiles-waybar.git
git push -u origin main
cd ..

# Kitty
cd kitty
git init
git add .
git commit -m "Initial commit: Kitty terminal configuration"
git branch -M main
git remote add origin git@github.com:mijaca09/dotfiles-kitty.git
git push -u origin main
cd ..

# Nvim
cd nvim
git init
git add .
git commit -m "Initial commit: Neovim LazyVim configuration"
git branch -M main
git remote add origin git@github.com:mijaca09/dotfiles-nvim.git
git push -u origin main
cd ..

# Yazi
cd yazi
git init
git add .
git commit -m "Initial commit: Yazi file manager configuration"
git branch -M main
git remote add origin git@github.com:mijaca09/dotfiles-yazi.git
git push -u origin main
cd ..

# Starship
cd starship
git init
git add .
git commit -m "Initial commit: Starship prompt configuration"
git branch -M main
git remote add origin git@github.com:mijaca09/dotfiles-zellij
7. `dotfiles-starship.git
git push -u origin main
cd ..
```

### Paso 3: Inicializar repo principal con submodules

```bash
cd ~/Code/mijaca09/dotfiles

# Inicializar repo principal
git init
git add README.md .dotfiles-meta/
git commit -m "Initial commit: Dotfiles management system"
git branch -M main
git remote add origin git@github.com:mijaca09/dotfiles.git

# Agregar cada dotfile como submodule
git submodule add git@github.com:mijaca09/dotfiles-hypr.git hypr
git submodule add git@github.com:mijaca09/dotfiles-waybar.git waybar
git submodule add git@github.com:mijaca09/dotfiles-kitty.git kitty
git submodule add git@github.com:mijaca09/dotfiles-nvim.git nvim
git submodule add git@github.com:mijaca09/dotfiles-yazi.git yazi
git submodule add git@github.com:mijaca09/dotfiles-zellij.git zellij
git submodule add git@github.com:mijaca09/dotfiles-starship.git starship
git submodule add git@github.com:mijaca09/dotfiles-zellij.git zellij
git submodule add git@github.com:mijaca09/dotfiles-starship.git starship

# Commit los submodules
git add .
git commit -m "Add all dotfiles as submodules"
git push -u origin main
```

### Paso 4: Crear symlinks

⚠️ **IMPORTANTE**: Esto reemplazará tus configs actuales con symlinks

```bash
cd ~/Code/mijaca09/dotfiles/.dotfiles-meta

# Opción 1: Instalar TODO
./install.sh

# Opción 2: Instalar individual (si quieres probar primero)
./install-kitty.sh  # Por ejemplo
```

### Paso 5: Verificar que funciona

```bash
# 1. Verificar symlinks
ls -la ~/.config/nvim    # Debe apuntar a ~/Code/mijaca09/dotfiles/nvim
ls -la ~/.config/kitty   # Debe apuntar a ~/Code/mijaca09/dotfiles/kitty

# 2. Hacer un cambio de prueba
echo "# Test" >> ~/.config/kitty/kitty.conf

# 3. Verificar que el cambio se refleja en el repo
cd ~/Code/mijaca09/dotfiles/kitty
git status  # Debe mostrar kitty.conf modificado

# 4. Commit y push
git add .
git commit -m "Test: Add comment"
git push

# 5. Verificar en GitHub que se subió
# Ir a: https://github.com/mijaca09/dotfiles-kitty

# 6. Actualizar repo principal
cd ~/Code/mijaca09/dotfiles
git add kitty
git commit -m "Update kitty submodule"
git push
```

### Paso 6: Configurar Git Hooks (OPCIONAL pero recomendado)

Para que al hacer push en un dotfile individual se actualice automáticamente el repo principal:

```bash
# En cada dotfile, crear post-commit hook
cd ~/Code/mijaca09/dotfiles/nvim/.git/hooks

cat > post-commit << 'HOOK'
#!/bin/bash
# Auto-update parent dotfiles repo
cd ~/Code/mijaca09/dotfiles
git add nvim
git commit -m "Auto-update: nvim submodule $(date '+%Y-%m-%d %H:%M:%S')" || true
git push || true
HOOK

chmod +x post-commit
```

Repetir para cada dotfile (hypr, waybar, kitty, yazi, starship).

## 📝 Resumen de comandos por copiar/pegar

### 1. Crear repos en GitHub (manual en navegador)
- dotfiles
- dotfiles-hypr
- dotfiles-waybar  
- dotfiles-kitty
- dotfiles-nvim
- dotfiles-yazi
- dotfiles-zellij
7. `dotfiles-starship

### 2. Inicializar y pushear dotfiles individuales

```bash
cd ~/Code/mijaca09/dotfiles

for dir in hypr waybar kitty nvim yazi zellij starship; do
  cd $dir
  git init
  git add .
  git commit -m "Initial commit: $dir configuration"
  git branch -M main
  git remote add origin git@github.com:mijaca09/dotfiles-$dir.git
  git push -u origin main
  cd ..
done
```

### 3. Crear repo principal con submodules

```bash
cd ~/Code/mijaca09/dotfiles
git init
git add README.md .dotfiles-meta/
git commit -m "Initial commit: Dotfiles management system"
git branch -M main
git remote add origin git@github.com:mijaca09/dotfiles.git

git submodule add git@github.com:mijaca09/dotfiles-hypr.git hypr
git submodule add git@github.com:mijaca09/dotfiles-waybar.git waybar
git submodule add git@github.com:mijaca09/dotfiles-kitty.git kitty
git submodule add git@github.com:mijaca09/dotfiles-zellij.git zellij
git submodule add git@github.com:mijaca09/dotfiles-starship.git starship
git submodule add git@github.com:mijaca09/dotfiles-zellij.git zellij
git submodule add git@github.com:mijaca09/dotfiles-starship.git starship
git submodule add git@github.com:mijaca09/dotfiles-zellij
7. `dotfiles-starship.git starship

git add .
git commit -m "Add all dotfiles as submodules"
git push -u origin main
```

### 4. Crear symlinks

```bash
cd ~/Code/mijaca09/dotfiles/.dotfiles-meta
./install.sh
```

## ✅ Checklist Final

- [ ] Repos creados en GitHub (7 repos)
- [ ] Dotfiles individuales pusheados
- [ ] Repo principal creado con submodules
- [ ] Symlinks creados
- [ ] Probado: modificar → commit → push
- [ ] Verificado en GitHub
- [ ] Git hooks configurados (opcional)

## 🆘 Si algo sale mal

1. **No puedes pushear**: Verifica SSH
   ```bash
   ssh -i ~/Code/mijaca09/mijaca09 -T git@github.com
   ```

2. **Symlink no funciona**: Recréalo
   ```bash
   rm ~/.config/nvim
   ln -s ~/Code/mijaca09/dotfiles/nvim ~/.config/nvim
   ```

3. **Git config incorrecto**: Verifica
   ```bash
   cd ~/Code/mijaca09/dotfiles/nvim
   git config user.name    # Debe ser: mijaca09
   git config user.email   # Debe ser: mijaca09@gmail.com
   ```

## 📞 Ayuda

Lee los archivos de documentación:
- `AI_CONTEXT.md` - Contexto completo
- `SETUP_GUIDE.md` - Guía detallada
- O pregunta a la IA con contexto

---

**¡Buena suerte con la configuración! 🚀**
