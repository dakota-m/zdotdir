# INFO:
# zsh-vi-mode: Snippet to config jeffreytse/zsh-vi-mode
#

# Change to Zsh's default readkey engine
# export ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_ZLE
export ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

# export ZVM_VI_HIGHLIGHT_BACKGROUND=#DF730D
export ZVM_VI_HIGHLIGHT_BACKGROUND=#56DB3A
export ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT

# Do the initialization when the script is sourced (i.e. Initialize instantly)
# export ZVM_INIT_MODE=sourcing

function zvm_config() {
  ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_NEX
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
}

# The plugin will auto execute this zvm_after_lazy_keybindings function
function zvm_after_lazy_keybindings() {
  zvm_bindkey viins '^R' fzf-history-widget
  zvm_bindkey vicmd '^R' fzf-history-widget
  # bindkey -M vicmd 's' your_normal_widget
  # bindkey -M visual 'n' your_visual_widget
}

bindkey -M viins '^R' fzf-history-widget
