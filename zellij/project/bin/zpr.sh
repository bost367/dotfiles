#!/usr/bin/env bash

set -u

zellij-project.sh project

# project_root="$(git rev-parse --show-toplevel || pwd)"
# project_layout_path="$HOME/.config/zellij/project/project.kdl"
#
# if [[ -n "${ZELLIJ+x}" ]]; then
#   zellij action new-tab \
#     --cwd "$project_root" \
#     --layout "$project_layout_path"
# else
#   pushd "$project_root" >/dev/null || exit 1
#   zellij --layout "${project_layout_path}"
#   popd >/dev/null || exit 1
# fi
