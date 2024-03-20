#
# asdf
#

# INFO: source: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/asdf/asdf.plugin.zsh

# Find where asdf should be installed
. /opt/asdf-vm/asdf.sh
export ASDF_DIR=/home/dakota/.config/asdf
# ASDF_DIR=${ASDF_DIR:-/opt/asdf-vm:-$XDG_CONFIG_HOME/asdf:-$HOME/.asdf}
# ASDF_DIR="${ASDF_DIR:-/opt/asdf-vm}"
export ASDF_COMPLETIONS="$ASDF_DIR/completions"
ARCH_ASDF_DIR="/opt/asdf-vm"
ASDF_SHIM_DIR="${ASDF_DATA_DIR:-$XDG_DATA_HOME/asdf:-$HOME/.local/share/asdf}/shims"

export ASDF_DEFAULT_TOOL_VERSIONS_FILENAME=".config/asdf/.tool-versions"

if [[ ! -f "$ASDF_DIR/asdf.sh" || ! -f "$ASDF_COMPLETIONS/_asdf" ]]; then
  # If not found, check for archlinux/AUR package (/opt/asdf-vm/)
  if [[ -f "${ARCH_ASDF_DIR}/asdf.sh" ]]; then
    if (( $+commands[rsync] )); then
      rsync -a --exclude='bin/' "${ARCH_ASDF_DIR}/" "${XDG_CONFIG_HOME:-$HOME/.config}/asdf/"
    else
      cp -r "${ARCH_ASDF_DIR}/." "${XDG_CONFIG_HOME:-$HOME/.config}/asdf"
    fi
    # ASDF_DIR="/opt/asdf-vm"
    ASDF_COMPLETIONS="$ASDF_DIR"
  # If not found, check for Homebrew package
  elif (( $+commands[brew] )); then
    _ASDF_PREFIX="$(brew --prefix asdf)"
    ASDF_DIR="${_ASDF_PREFIX}/libexec"
    ASDF_COMPLETIONS="${_ASDF_PREFIX}/share/zsh/site-functions"
    unset _ASDF_PREFIX
  else
    return
  fi
fi

if (( ! ${(s: :)path[(Ie)$ASDF_SHIM_DIR]} )); then
  path+=("$ASDF_SHIM_DIR")
fi

# Load command
if [[ -f "$ASDF_DIR/asdf.sh" ]]; then
  source "$ASDF_DIR/asdf.sh"
  # Load completions
  if [[ -f "$ASDF_COMPLETIONS/_asdf" ]]; then
    fpath+=("$ASDF_COMPLETIONS")
    autoload -Uz _asdf
    compdef _asdf asdf # compdef is already loaded before loading plugins
  fi
fi

alias asdftv='$EDITOR ~/.config/asdf/.tool-versions'
