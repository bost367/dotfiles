#!/usr/bin/env bash

set -u

envs="YAZI_CONFIG_HOME='~/.config/zellij/project/yazi/'"
envs="$envs PROJECT_EDITOR='project-editor.sh'"
env -S "$envs" yazi
