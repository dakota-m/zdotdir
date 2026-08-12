# # https://wezfurlong.org/wezterm/shell-integration.html
# # https://github.com/wez/wezterm/blob/main/assets/shell-integration/wezterm.sh
#
[[ "${TERM_PROGRAM:l}" == "wezterm" ]] || return 1

source "$ZDOTDIR/lib/wezterm-shell-integration.sh"

function set_current_shell() {
  # Guard: only run inside real WezTerm panes.
  [[ -n "${WEZTERM_PANE:-}" ]] || return 0

  # Throttle: avoid sending unchanged values on every precmd.
  local value="zsh ${${ZSH_PATCHLEVEL:-$ZSH_VERSION}#zsh-}"
  [[ "${__wezterm_term_current_shell_last:-}" == "$value" ]] && return 0
  typeset -g __wezterm_term_current_shell_last="$value"
  __wezterm_set_user_var "TERM_CURRENT_SHELL" "$value"
}
set_current_shell
autoload -Uz add-zsh-hook
add-zsh-hook precmd set_current_shell
