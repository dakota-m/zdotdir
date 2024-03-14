#
# WezTerm
#

function update_wezterm_completions {
  # Download the latest completions from the wezterm repo
  local giturl=https://raw.githubusercontent.com/wez/wezterm/main/assets/shell-completion
  local dest=${1:-${XDG_DATA_HOME:-~/.local/share}/zsh/completions}
  [[ ! -d $dest ]] || mkdir -p $dest
  # TODO: add bash completions
  # curl -fsSL $giturl/bash -o $dest/_wezterm
  curl -fsSL $giturl/zsh -o $dest/_wezterm
}

# add completions for wezterm
fpath=(${XDG_DATA_HOME:-~/.local/share}/zsh/completions $fpath)
[[ -f ${fpath[1]}/_wezterm ]] || update_wezterm_completions
# TODO: check zstyle options
# zstyle ':completion'

function update_wezterm_shell_integration {
  local giturl=https://raw.githubusercontent.com/wez/wezterm/main/assets/shell-integration/wezterm.sh
  local dest=${1:-${XDG_DATA_HOME:-~/.local/share}/zsh/shell-integration}
  # [[ ! -d $dest ]] || mkdir -p $dest
  if [[ ! -d $dest ]]; then
    mkdir -p $dest
  fi
  curl -fsSL $giturl -o $dest/wezterm.sh
}

# [[ -f ${1:-${XDG_DATA_HOME:-$HOME/.local/share}/zsh/shell-integration}/wezterm.sh ]] || update_wezterm_shell_integration
[[ -f ${XDG_DATA_HOME:-$HOME/.local/share}/zsh/shell-integration/wezterm.sh ]] || update_wezterm_shell_integration
source ${1:-${XDG_DATA_HOME:-~/.local/share}/zsh/shell-integration}/wezterm.sh
