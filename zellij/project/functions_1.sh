#!/usr/bin/env bash

set -u

# paths=$(yazi "$2" --chooser-file=/dev/stdout | while read -r; do printf "%q " "$REPLY"; done)
action="$1"
paths=$(echo "$2" | sed 's/ / :e /g') # Для нескольких файлов
zellij action move-focus right        # Переключитесь на панель Neovim (адаптируйте под вашу раскладку)
zellij action write 27                # ESC
zellij action write-chars ":$action $paths"
zellij action write 13        # Enter
# zellij action move-focus left # Вернитесь в Yazi
