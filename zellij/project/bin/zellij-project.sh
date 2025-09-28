#!/usr/bin/env bash

set -u

project() {
  project_root="$(git rev-parse --show-toplevel || pwd)"
  project_layout_path="$HOME/.config/zellij/project/project.kdl"

  if [[ -n "${ZELLIJ+x}" ]]; then
    # Open in current zellij session
    zellij action new-tab \
      --cwd "$project_root" \
      --layout "$project_layout_path"
  else
    # Open new zellij session
    pushd "$project_root" >/dev/null || exit 1
    zellij --layout "${project_layout_path}"
    popd >/dev/null || exit 1
  fi
}

filepicker() {
  envs="YAZI_CONFIG_HOME='~/.config/zellij/project/yazi/'"
  envs="$envs PROJECT_EDITOR='project-editor.sh'"
  env -S "$envs" yazi
}

edit() {
  paths=("$1")
  # Ensure paths with special chars (like spaces) are properly escaped
  escaped_paths=()
  for path in "${paths[@]}"; do
    escaped_paths+=("$(printf "%q" "$path")")
  done
  # path=${escaped_paths[0]}

  # Open paths in the editor
  if [[ -n "${escaped_paths[*]}" ]]; then
    zellij action write 27                                # send <Escape> key to enter NORMAL mode
    zellij action move-focus right                        # focus on editor
    zellij action write-chars ":args ${escaped_paths[*]}" # open files
    zellij action write 13                                # send <Enter> key
  fi
}

"$@"
