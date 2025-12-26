# 🌿 Mis Dotfiles (Setup Personal de mijaca09)

¡Hola! Este es el rincón donde guardo toda la configuración de mi entorno de trabajo. No es solo un montón de archivos; es el resultado de muchas horas ajustando cada detalle para que mi sistema se sienta productivo, rápido y, sobre todo, bonito.

Uso **Zorin OS 18** con **Hyprland**, y he intentado que todo tenga esa estética **Tokyo Night** y **Rosé Pine** que tanto me gusta: limpia, oscura y con esos toques elegantes que hacen que trabajar sea un placer.

---

## 🚀 Instalación y Contenidos

Aquí tienes una lista de todo lo que incluye el script de instalación automática. Haz clic en cada uno para ver una explicación detallada de su configuración y temas:

*   [**Hyprland**](#hyprland-el-corazón-del-wm): Gestor de ventanas y animaciones.
*   [**Waybar**](#waybar-tu-barra-de-estado): Información del sistema integrada.
*   [**Neovim (LazyVim)**](#neovim-lazyvim-el-editor-definitivo): Editor de código ultra-vitaminado.
*   [**Rofi**](#rofi-tu-centro-de-control): Lanzador y gestor de sistema interactivo.
*   [**Terminales (Kitty/Alacritty)**](#terminales-kitty-y-alacritty): Tus puertas de entrada a la shell.
*   [**Tmux**](#tmux-multiplexor-de-sesiones): Gestión persistente de sesiones.
*   [**Starship**](#starship-el-prompt-elegante): Un prompt rápido y bonito.

---

## 📘 Detalles de la Configuración

### Hyprland: El Corazón del WM
Es mi gestor de ventanas tipo *tiling*. Lo he configurado para ser extremadamente fluido con animaciones suaves. Incluye atajos para todo, desde mover ventanas hasta controlar el brillo y el volumen.
*   **Temas**: Tokyo Night.

### Waybar: Tu Barra de Estado
Ubicada en la parte superior, te da toda la info crítica de un vistazo: batería, volumen, Wi-Fi y reloj. Está diseñada para ser minimalista y no estorbar.
*   **Temas**: Tokyo Night (fondo oscuro `#24283b`).

### Neovim (LazyVim): El Editor Definitivo
Basado en LazyVim, está configurado para desarrollo moderno. Incluye soporte para múltiples lenguajes, autcompletado inteligente y una estética impecable.
*   **Temas**: Tokyo Night.

### Rofi: Tu Centro de Control
No es solo un lanzador. He creado scripts específicos para que desde Rofi puedas gestionar el Bluetooth (escanear, conectar, desconectar), cambiar el fondo de pantalla con previsualización y controlar el brillo/volumen.
*   **Temas**: Tokyo Night.

### Terminales: Kitty y Alacritty
El script te permite elegir cuál prefieres. Ambas están configuradas con transparencia y la fuente **Iosevka Nerd Font** para que se vean geniales.
*   **Temas**: Tokyo Night.

### Tmux: Multiplexor de Sesiones
Me permite mantener mis proyectos abiertos en segundo plano. He añadido un gestor de sesiones interactivo para saltar de un proyecto a otro sin esfuerzo.
*   **Atajo**: `Ctrl + a + S`.

### Starship: El Prompt Elegante
He actualizado el prompt para que sea minimalista pero informativo, dándote contexto de Git y del lenguaje de programación en el que estés trabajando.
*   **Temas**: **Rosé Pine** (Elegancia pura en cada comando).

---

## 🛠️ Cómo usar este sistema

1.  **Clona el repo**:
    ```bash
    git clone https://github.com/mijaca09/dotfiles.git ~/Code/mijaca09/dotfiles
    ```

2.  **Instala todo**:
    ```bash
    cd ~/Code/mijaca09/dotfiles/.dotfiles-meta
    ./install.sh
    ```

El script se encargará de instalar las fuentes, los paquetes y de preguntarte qué terminal prefieres.

---

Espero que estos dotfiles te inspiren. Si tienes alguna duda, ¡pásate por mis repos!

**-- mijaca09**
