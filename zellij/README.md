# Zellij Configuration

Configuración de Zellij terminal multiplexer.

## 🎨 Características

- **Multiplexer**: Terminal workspace con tabs y panes
- **Editor**: nvim configurado por defecto
- **Mouse**: Soporte de mouse activado
- **Layouts**: Soporte de layouts personalizados

## 🚀 Instalación

```bash
git clone git@github.com:mijaca09/dotfiles-zellij.git ~/.config/zellij
# O usar: ./install-zellij.sh
```

## ⌨️ Atajos Principales

**Modo normal** (presiona `Ctrl+g` para ayuda):

- `Ctrl+p` + `n`: Nueva pestaña
- `Ctrl+p` + `h/j/k/l`: Navegar entre panes
- `Ctrl+p` + `x`: Cerrar pane
- `Ctrl+p` + `d`: Detach de sesión
- `Ctrl+p` + `q`: Salir de zellij

## 📝 Uso Básico

```bash
# Iniciar zellij
zellij

# Iniciar con layout específico
zellij --layout compact

# Listar sesiones
zellij list-sessions

# Adjuntar a sesión
zellij attach nombre-sesion

# Detach
Ctrl+p + d
```

## 🔧 Personalizar

Editar `config.kdl` para personalizar:
- Temas
- Keybindings
- Layouts
- Plugins

Documentación: https://zellij.dev/documentation/

---

Parte del sistema de dotfiles: [mijaca09/dotfiles](https://github.com/mijaca09/dotfiles)
