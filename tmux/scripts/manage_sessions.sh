#!/usr/bin/env bash

# Gestor de Sesiones de Tmux con fzf (Universal: Dentro y Fuera de Tmux)

get_sessions() {
    tmux list-sessions -F "#{session_name}" 2>/dev/null
}

export FZF_DEFAULT_OPTS="--ansi --layout=reverse --border=rounded --color='border:#39bae6,header:#39bae6,prompt:#39bae6,pointer:#ff3333,marker:#ff3333'"

# Si no hay sesiones activas, ofrecer crear una directamente si estamos fuera de tmux
if [[ -z $(get_sessions) ]]; then
    if [[ -z "$TMUX" ]]; then
        echo -e "\033[33mNo hay sesiones activas.\033[0m"
        echo -n "Nombre para nueva sesión (o pulsar Enter para cancelar): "
        read session_name
        if [[ -n "$session_name" ]]; then
            tmux new-session -s "$session_name"
        fi
        exit 0
    fi
fi

selected=$(get_sessions | \
    ~/.fzf/bin/fzf --prompt="Sesiones > " \
        --header="Enter: Conectar | Ctrl-x: Eliminar | Ctrl-n: Nueva | Ctrl-r: Renombrar" \
        --bind 'ctrl-x:execute(tmux kill-session -t {})+reload(tmux list-sessions -F "#{session_name}")' \
        --expect=ctrl-n,ctrl-r
)

key=$(echo "$selected" | head -n1)
session=$(echo "$selected" | tail -n1)

case "$key" in
    "ctrl-n")
        clear
        echo -e "\033[36mNueva Sesión Tmux\033[0m"
        echo -n "Introduce el nombre de la sesión: "
        read session_name
        if [[ -n "$session_name" ]]; then
            tmux new-session -d -s "$session_name"
            if [[ -n "$TMUX" ]]; then
                tmux switch-client -t "$session_name"
            else
                tmux attach-session -t "$session_name"
            fi
        fi
        ;;
    "ctrl-r")
        if [[ -n "$session" ]]; then
            clear
            echo -e "\033[36mRenombrar Sesión: $session\033[0m"
            echo -n "Nuevo nombre: "
            read new_name
            if [[ -n "$new_name" ]]; then
                tmux rename-session -t "$session" "$new_name"
            fi
        fi
        ;;
    *)
        if [[ -n "$session" ]]; then
            if [[ -n "$TMUX" ]]; then
                tmux switch-client -t "$session"
            else
                tmux attach-session -t "$session"
            fi
        fi
        ;;
esac
