# 🌿 Mis Dotfiles (Setup Personal de mijaca09)

¡Hola! Este es el rincón donde guardo toda la configuración de mi entorno de trabajo. No es solo un montón de archivos; es el resultado de muchas horas ajustando cada detalle para que mi sistema se sienta productivo, rápido y, sobre todo, bonito.

Uso **Zorin OS 18** con **Hyprland**, y he intentado que todo tenga esa estética **Tokyo Night** que tanto me gusta: limpia, oscura y con esos toques azules y morados que se ven genial.

## 🛠️ ¿Qué hay aquí dentro?

He configurado varias herramientas para que funcionen juntas de forma fluida:

*   **Hyprland**: Mi gestor de ventanas. Fluidez total con animaciones y atajos que me permiten moverme a la velocidad del rayo.
*   **Waybar**: Una barra de estado minimalista pero con toda la info que necesito (batería, volumen, wifi).
*   **Neovim (LazyVim)**: Mi editor principal. Está ultra-vitaminado para escribir código sin distracciones.
*   **Rofi**: No solo lanza apps, también lo uso como un "Centro de Control" para gestionar el Bluetooth, el volumen y hasta cambiar el fondo de pantalla con previsualizaciones.
*   **Tmux**: Para no perder nunca mis sesiones de terminal, con un gestor interactivo que hice para moverme entre proyectos.

## 🚀 Cómo usar este sistema

Si quieres probar mi configuración o simplemente curiosear, el proceso es muy sencillo. He preparado un script que se encarga de lo más aburrido (instalar programas y fuentes).

1.  **Clona el repo**:
    ```bash
    git clone https://github.com/mijaca09/dotfiles.git ~/Code/mijaca09/dotfiles
    ```

2.  **Instala todo**:
    ```bash
    cd ~/Code/mijaca09/dotfiles/.dotfiles-meta
    ./install.sh
    ```

El script instalará las fuentes (**Iosevka Nerd Font** es mi favorita), los paquetes necesarios y creará los enlaces para que todo funcione al instante.

## ⌨️ Atajos que uso a diario (Cheat Sheet)

He incluido un menú de ayuda dentro del sistema (**F3 -> Shortcuts**), pero aquí tienes lo básico:

*   **Super + Espacio**: Lanzador de aplicaciones.
*   **Super + Q**: Cerrar la ventana actual.
*   **F3**: El "botón de pánico" (Power Menu y Centro de Control).
*   **Ctrl + a + S**: Mi gestor de sesiones en Tmux.

---

Espero que estos dotfiles te sirvan de inspiración o te ayuden a montar tu propio entorno. Si tienes alguna duda o quieres saludar, ¡pásate por mis repos!

**-- mijaca09**
