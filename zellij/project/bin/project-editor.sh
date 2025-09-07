#!/usr/bin/env bash

set -u

paths=("$@")
# Ensure paths with special chars (like spaces) are properly escaped
escaped_paths=()
for path in "${paths[@]}"; do
  escaped_paths+=("$(printf "%q" "$path")")
done
# path=${escaped_paths[0]}

# Open paths in the editor
if [[ -n "${escaped_paths[*]}" ]]; then
  zellij action write 27         # send <Escape> key to enter NORMAL mode
  zellij action move-focus right # focus on editor
  zellij action write-chars ":args ${escaped_paths[*]}" # open files
  zellij action write 13 # send <Enter> key
fi
