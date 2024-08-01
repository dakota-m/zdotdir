if [[ "$(uname)" == "Darwin" ]]; then
  if [[ -d $XDG_PROJECTS_DIR/fzf ]]; then
    export FZF_PATH=$XDG_PROJECTS_DIR/fzf
  fi
elif [[ "$(uname)" == "Linux" ]]; then
  if [[ -d $XDG_PROJECTS_DIR/fzf ]]; then
    export FZF_PATH=$XDG_PROJECTS_DIR/fzf
  fi
fi

if [[ -d $XDG_PROJECTS_DIR/fzf ]]; then
  # export FZF_DEFAULT_OPTS="--height 40% --reverse --border --ansi --multi --cycle"
  # export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
  # export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  # export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git"
  # export FZF_TMUX=1
  # export FZF_TMUX_HEIGHT=40%
  # export FZF_TMUX_OPTS="--height 40% --reverse --border --ansi --multi --cycle"
  # export FZF_COMPLETION_TRIGGER='**'
  # export FZF_COMPLETION_OPTS='--preview "bat --style=numbers --color=always {}"'
  # export FZF_PREVIEW_COMMAND="bat --style=numbers --color=always"
  # export FZF_PREVIEW_OPTS="--height 40% --border --ansi --wrap"
  # export FZF_PREVIEW_FILE="$FZF_PREVIEW_COMMAND {}"
  # [[ $- == *i* ]] && source "${XDG_PROJECTS_DIR}/fzf/shell/completion.zsh"
  # source "${XDG_PROJECTS_DIR}/fzf/shell/key-bindings.zsh"
fi

# [[ $- == *i* ]] && source "${XDG_CONFIG_HOME}/fzf/completion.zsh"
# source "${XDG_CONFIG_HOME}/fzf/key-bindings.zsh"
