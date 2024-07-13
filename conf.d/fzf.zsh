# INFO:
# zsh-vi-mode: Snippet to config jeffreytse/zsh-vi-mode
#

if [[ -f /usr/share/fzf/completion.zsh && -f /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/completion.zsh
  source /usr/share/fzf/key-bindings.zsh
fi

# TODO: using defer overwrites this setting
# export FZF_DEFAULT_OPTS=<< EOL
# --layout=reverse
# --info=inline
# --height=80%
# --multi
# --preview='([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tre -c=always {} | less)) || echo {} 2>/dev/null | head -n 200'
# --preview-window=':hidden'
# --color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
# --prompt='∼ '
# --pointer='▶'
# --marker='✓'
# --bind '?:toggle-preview'
# --bind 'ctrl-a:select-all'
# --bind 'ctrl-e:execute(vim {+} >/dev/tty)'
# --bind 'ctrl-v:execute(code {+})'
# --bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
# EOL

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
