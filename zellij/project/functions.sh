#!/usr/bin/env bash

set -u

run_nvim_server() {
  nvim --listen /tmp/nvim.socket
}

yazi_project() {
  env "YAZI_CONFIG_HOME=~/.config/zellij/project" yazi
  # yazi
}

open_file_nvim() {
  ACTION="$1"
  paths=$(echo "$2" | sed 's/ / :e /g') # Для нескольких файлов
  zellij action move-focus right        # Переключитесь на панель Neovim (адаптируйте под вашу раскладку)
  zellij action write 27                # ESC
  zellij action write-chars ":$ACTION $paths"
  zellij action write 13        # Enter
  zellij action move-focus left # Вернитесь в Yazi
}

"$@"
