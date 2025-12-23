#!/usr/bin/env bash

# Formatear atajos de Tmux: (Teclas) Descripción
# Usamos tmux list-keys -N para obtener los atajos con nota/descripción
# Luego usamos awk para formatear y fzf para buscar.

tmux list-keys -N | awk '
{
    # El primer bloque suele ser el atajo (puede tener espacios si es Prefix + Tecla)
    # Buscamos donde empiezan los espacios múltiples (al menos 2)
    match($0, /  +/)
    if (RSTART > 0) {
        keys = substr($0, 1, RSTART - 1)
        desc = substr($0, RSTART + RLENGTH)
        # Limpiar espacios extra
        gsub(/^[[:space:]]+|[[:space:]]+$/, "", keys)
        gsub(/^[[:space:]]+|[[:space:]]+$/, "", desc)
        # Formatear: (Teclas) Descripción
        printf "\033[36m(%s)\033[0m  %s\n", keys, desc
    }
}' | column -t -s "  " -o "  " | \
grep -v "^()" | \
~/.fzf/bin/fzf --ansi \
    --prompt="Buscar atajo > " \
    --header="Atajos de Tmux | Búsqueda por (teclas) o descripción" \
    --layout=reverse \
    --border=rounded \
    --color="border:#39bae6,header:#39bae6,prompt:#39bae6,pointer:#ff3333,marker:#ff3333"
