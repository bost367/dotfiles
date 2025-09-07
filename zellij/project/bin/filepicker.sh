#!/usr/bin/env bash

set -u

envs="YAZI_CONFIG_HOME='~/.config/zellij/project/yazi/'"
envs="$envs PROJECT_EDITOR='project-editor.sh'"
project=$(git rev-parse --show-toplevel || pwd)
env -S "$envs" yazi --cwd-file="$project"
