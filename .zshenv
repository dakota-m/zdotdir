#!/bin/zsh
#
# .zshenv: Zsh environment file, loaded always.
#

export ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}
export STARSHIP_CONFIG=${ZDOTDIR:-$HOME/.config/zsh}/themes/starship.toml

# TODO: figure out where to put these
# fpath=(/home/dakota/.granted/zsh_autocomplete/assume/ $fpath)
# fpath=(/home/dakota/.granted/zsh_autocomplete/granted/ $fpath)

# XDG
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
# export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-$HOME/.xdg}
# export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-$HOME/.xdg:-/run/user/1000}
export XDG_PROJECTS_DIR=${XDG_PROJECTS_DIR:-$HOME/Projects}

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# export ZEPHYR_HOME=${ZEPHYR_HOME:-$HOME/Projects/dakota-m/zsh-zephyr}

# if [[ "$(uname)" == "Darwin" ]]; then
#   # export TERMINFO=/usr/share/terminfo
#   # export GOPATH=$HOME/go
#   # export GOROOT=/opt/homebrew/bin/go/libexec
#   # export GOBIN=/opt/homebrew/bin/go
#   # export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
# fi

# export LC_ALL=en_US.UTF-8
# export SECOND_BRAIN=$HOME/Documents/obsidian/notes
# export OBSIDIAN_REST_API_KEY=***REMOVED***
# export MAKEFLAGS="-j$(nproc --ignore=2)"

# Apothesource ENV Vars
#
# BitBucket
export VA_BITBT_USER=***REMOVED***
# export VA_BITBT_PWD=***REMOVED***
# HTTP Token
export VA_BITBT_PWD=***REMOVED***
export BKT_TOKEN=***REMOVED***
export BKT_HOST=https://coderepo.mobilehealth.va.gov

# Sandbox DTR
export DTR_USER=***REMOVED***
export DTR_PWD=***REMOVED***
export DTR_URL=dtr.mapsandbox.net
# VA Nexus
export VA_NEXUS_USER=***REMOVED***
# export VA_NEXUS_USER="***REMOVED***"
export VA_NEXUS_PWD=***REMOVED***
# export VA_NEXUS_PWD="***REMOVED***"

export SKAFFOLD_PUSH=false
export SKAFFOLD_RPC_PORT=50051

# Github Tokens
export COPILOT_GITHUB_TOKEN=***REMOVED***
# export GH_TOKEN=***REMOVED***
# export GITHUB_TOKEN=***REMOVED***
export GH_HOST=va.ghe.com

# export CC="gcc"
# export CXX="gcc++"

# export RUSTFLAGS="-C target-cpu=znver3"

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
} __zsh_{config,user_data,cache}_dir XDG_{CONFIG,CACHE,DATA,STATE}_HOME XDG_PROJECTS_DIR # {RUNTIME,PROJECTS}_DIR

# Make Terminal.app behave.
if [[ "$OSTYPE" == darwin* ]]; then
  export SHELL_SESSIONS_DISABLE=1
fi
. "$HOME/.cargo/env"
