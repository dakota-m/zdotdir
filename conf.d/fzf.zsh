# INFO:
# zsh-vi-mode: Snippet to config jeffreytse/zsh-vi-mode
#

# export FZF_BASE="$(which fzf)"
# export FZF_PATH="/home/dakota/tools/fzf"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
# export FZF_CTRL_R_OPTS="
#   --preview 'echo {}' --preview-window up:3:hidden:wrap
#   --bind 'ctrl-/:toggle-preview'
#   --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
#   --color header:italic
#   --header 'Press CTRL-Y to copy command into clipboard'"

# zle     -N       fzf-history-widget
# bindkey -r '^R'
# bindkey    '^R'  fzf-history-widget
# bindkey -M main  '^R' fzf-history-widget
# bindkey -M emacs '^R' fzf-history-widget
# bindkey -M vicmd '^R' fzf-history-widget
# bindkey -M viins '^R' fzf-history-widget
