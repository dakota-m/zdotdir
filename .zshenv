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

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

if command -v aocc-clang > /dev/null 2>&1; then
  export CC="aocc-clang"
  export CXX="aocc-clang++"
  export OMP_NUM_THREADS=22
  export GOMP_CPU_AFFINITY="0-23"
  # AOCC Compiler Libraries
  export AOCL_ROOT=/opt/aocl/aocc;
  export C_INCLUDE_PATH=/opt/aocl/aocc/include:$C_INCLUDE_PATH
  export CPLUS_INCLUDE_PATH=/opt/aocl/aocc/include:$CPLUS_INCLUDE_PATH
  export LD_LIBRARY_PATH=/opt/aocl/aocc/lib:$LD_LIBRARY_PATH
  export LIBRARY_PATH=/opt/aocl/aocc/lib:$LIBRARY_PATH
fi

export LC_ALL=en_US.UTF-8
export SECOND_BRAIN=$HOME/Documents/obsidian/notes
export OBSIDIAN_REST_API_KEY=f66f902ac15d8773ff8f8fde96ac2fb983216a1d6fc9ee35d84732393d83b993

path=(
  $HOME/bin(/N)
  $HOME/.local/bin(/N)
  /opt/homebrew/{,s}bin(/N)
  /usr/local/{,s}bin(/N)
  /usr/{,s}bin(/N)
  /{usr/local,opt}/bin(N)
  /opt/*(N)
  /opt/*/bin(N)
  $path
)

# macOS
if [[ "$OSTYPE" == darwin* ]]; then
  # Make Apple Terminal behave.
  export SHELL_SESSIONS_DISABLE=1
fi

# export CC="gcc"
# export CXX="gcc++"

# export RUSTFLAGS="-C target-cpu=znver3"

# Fish-like dirs
# : ${__zsh_config_dir:=${ZDOTDIR:-${XDG_CONFIG_HOME:-$HOME/.config}/zsh}}
# : ${__zsh_user_data_dir:=${XDG_DATA_HOME:-$HOME/.local/share}/zsh}
# : ${__zsh_cache_dir:=${XDG_CACHE_HOME:-$HOME/.cache}/zsh}

# export FZF_PATH=${XDG_CACHE_HOME:-$HOME/.cache}/repos/unixorn/fzf-zsh-plugin

# Ensure Zsh directories exist.
# () {
#   local zdir
#   for zdir in $@; do
#     [[ -d "${(P)zdir}" ]] || mkdir -p -- "${(P)zdir}"
#   done
# } __zsh_{config,user_data,cache}_dir XDG_{CONFIG,CACHE,DATA,STATE}_HOME XDG_PROJECTS_DIR
