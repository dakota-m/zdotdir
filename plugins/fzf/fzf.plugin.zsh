if [[ "$(uname)" == "Darwin" ]]; then
  if [[ -d $XDG_PROJECTS_DIR/fzf ]]; then
    export FZF_PATH=$XDG_PROJECTS_DIR/fzf
  fi
elif [[ "$(uname)" == "Linux" ]]; then
  if [[ -d $XDG_PROJECTS_DIR/fzf ]]; then
    export FZF_PATH=$XDG_PROJECTS_DIR/fzf
  fi
fi

# export FZF_DEFAULT_OPTS=$(echo "$FZF_DEFAULT_OPTS" | sed \
#   -e "s/--color='\([^']*\)'/--color='\1,border:#27a1b9'/")
# echo $FZF_DEFAULT_OPTS

# export FZF_COLOR_SCHEME=$(echo "$FZF_DEFAULT_OPTS" | sed \
#   -e "s/--color='\([^']*\)'/--color='\1,border:#27a1b9'/")
# echo $FZF_DEFAULT_OPTS

# export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
#   --highlight-line \
#   --info=inline-right \
#   --ansi \
#   --layout=reverse \
#   --border=none
#   --color=bg+:#283457 \
#   --color=border:#27a1b9 \
#   --color=fg:#c0caf5 \
#   --color=gutter:#16161e \
#   --color=header:#ff9e64 \
#   --color=hl+:#2ac3de \
#   --color=hl:#2ac3de \
#   --color=info:#545c7e \
#   --color=marker:#ff007c \
#   --color=pointer:#ff007c \
#   --color=prompt:#2ac3de \
#   --color=query:#c0caf5:regular \
#   --color=scrollbar:#27a1b9 \
#   --color=separator:#ff9e64 \
#   --color=spinner:#ff007c \
#   --pointer=' ' \
#   --marker='󰓒 ' \
# "
#
# if [[ -d $XDG_PROJECTS_DIR/fzf ]]; then
#   # export FZF_DEFAULT_OPTS="--height 40% --reverse --border --ansi --multi --cycle"
#   # export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
#   # export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#   # export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git"
#   # export FZF_TMUX=1
#   # export FZF_TMUX_HEIGHT=40%
#   # export FZF_TMUX_OPTS="--height 40% --reverse --border --ansi --multi --cycle"
#   # export FZF_COMPLETION_TRIGGER='**'
#   # export FZF_COMPLETION_OPTS='--preview "bat --style=numbers --color=always {}"'
#   # export FZF_PREVIEW_COMMAND="bat --style=numbers --color=always"
#   # export FZF_PREVIEW_OPTS="--height 40% --border --ansi --wrap"
#   # export FZF_PREVIEW_FILE="$FZF_PREVIEW_COMMAND {}"
#   # [[ $- == *i* ]] && source "${XDG_PROJECTS_DIR}/fzf/shell/completion.zsh"
#   # source "${XDG_PROJECTS_DIR}/fzf/shell/key-bindings.zsh"
# fi
#
# # [[ $- == *i* ]] && source "${XDG_CONFIG_HOME}/fzf/completion.zsh"
# # source "${XDG_CONFIG_HOME}/fzf/key-bindings.zsh"
