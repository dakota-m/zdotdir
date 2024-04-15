#!/bin/zsh
#
# .zshenv: Zsh environment file, loaded always.
#

export ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}

# TODO: figure out where to put these
fpath=(/home/dakota/.granted/zsh_autocomplete/assume/ $fpath)
fpath=(/home/dakota/.granted/zsh_autocomplete/granted/ $fpath)

# XDG
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
# export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-$HOME/.xdg}
# export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-$HOME/.xdg:-/run/user/1000}
export XDG_PROJECTS_DIR=${XDG_PROJECTS_DIR:-$HOME/Projects}

export CC="aocc-clang"
export CXX="aocc-clang++"

# Fish-like dirs
: ${__zsh_config_dir:=${ZDOTDIR:-${XDG_CONFIG_HOME:-$HOME/.config}/zsh}}
: ${__zsh_user_data_dir:=${XDG_DATA_HOME:-$HOME/.local/share}/zsh}
: ${__zsh_cache_dir:=${XDG_CACHE_HOME:-$HOME/.cache}/zsh}

# export FZF_PATH=${XDG_CACHE_HOME:-$HOME/.cache}/repos/unixorn/fzf-zsh-plugin

# Ensure Zsh directories exist.
() {
  local zdir
  for zdir in $@; do
    [[ -d "${(P)zdir}" ]] || mkdir -p -- "${(P)zdir}"
  done
} __zsh_{config,user_data,cache}_dir XDG_{CONFIG,CACHE,DATA,STATE}_HOME XDG_PROJECTS_DIR
