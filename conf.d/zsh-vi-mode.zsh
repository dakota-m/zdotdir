# INFO:
# zsh-vi-mode: Snippet to config jeffreytse/zsh-vi-mode
#

# Change to Zsh's default readkey engine
# export ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_ZLE
export ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

# export ZVM_VI_HIGHLIGHT_BACKGROUND=#DF730D
export ZVM_VI_HIGHLIGHT_BACKGROUND=#56DB3A
export ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
export ZVM_VI_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BEAM
export ZVM_VI_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK

# Do the initialization when the script is sourced (i.e. Initialize instantly)
# export ZVM_INIT_MODE=sourcing

function zvm_config() {
  # Disable the cursor style feature
  # ZVM_CURSOR_STYLE_ENABLED=true
  # ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_NEX
  # ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  # ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
  # ZVM_VI_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
  # ZVM_VI_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BEAM
}

# The plugin will auto execute this zvm_after_lazy_keybindings function
function zvm_after_lazy_keybindings() {
  # zvm_bindkey visual 'y' zvm_vi_yank
  # zvm_bindkey viins '^R' fzf-history-widget
  # zvm_bindkey vicmd '^R' fzf-history-widget
  # bindkey -M vicmd 's' your_normal_widget
  # bindkey -M visual 'n' your_visual_widget
}

# bindkey -M viins '^R' fzf-history-widget

# # Yank function with wayland support
# function zvm_vi_yank() {
#   zvm_yank
#   if command -v wl-copy >/dev/null 2>&1; then
#     printf %s "$CUTBUFFER" | wl-copy
#   elif command -v pbcopy >/dev/null 2>&1; then
#     printf %s "$CUTBUFFER" | pbcopy
#   else
#     continue
#   fi
#   zvm_exit_visual_mode ${1:-true}
# }

# Override default vi functions to use wl-copy and wl-paste for wayland support
for f in zvm_backward_kill_region zvm_yank zvm_replace_selection zvm_change_surround_text_object zvm_vi_delete zvm_vi_change zvm_vi_change_eol; do
  eval "$(
    echo "_$f() {"
    declare -f $f | tail -n +2
  )"
  if command -v wl-copy >/dev/null 2>&1; then
    eval "$f() { _$f; echo -en \$CUTBUFFER | wl-copy }"
  elif command -v pbcopy >/dev/null 2>&1; then
    eval "$f() { _$f; echo -en \$CUTBUFFER | pbcopy }"
  fi
done

for f in zvm_vi_put_after zvm_vi_put_before; do
  eval "$(
    echo "_$f() {"
    declare -f $f | tail -n +2
  )"
  if command -v wl-copy >/dev/null 2>&1; then
    eval "$f() { CUTBUFFER=\$(wl-paste); _$f; zvm_highlight clear }"
  elif command -v pbcopy >/dev/null 2>&1; then
    eval "$f() { CUTBUFFER=\$(pbcopy); _$f; zvm_highlight clear }"
  fi
done

# vim: ft=sh ts=2 sw=2 et
