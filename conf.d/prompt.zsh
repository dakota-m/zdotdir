#
# prompt: Set up the Zsh prompt system.
#

# Keep Zephyr as the sole prompt initializer.
setopt prompt_subst transient_rprompt

# Defer non-critical prompt behavior until after first prompt render.
if (( $+functions[zsh-defer] )); then
  zsh-defer true
fi
