#!/bin/zsh
#
# .zshrc - Run on interactive Zsh session.
#

#
# Profiling
#

[[ "$ZPROFRC" -ne 1 ]] || zmodload zsh/zprof
alias zprofrc="ZPROFRC=1 zsh"

#
# Zstyles
#

# Load .zstyles file with customizations.
[[ -r ${ZDOTDIR:-$HOME}/.zstyles ]] && source ${ZDOTDIR:-$HOME}/.zstyles

#
# Theme
#

# Set prompt theme
ZSH_THEME=(starship starship)
#ZSH_THEME=(starship zephyr)
#ZSH_THEME=(p10k mmc)

is-theme-p10k()     { [[ "$ZSH_THEME" == (p10k|powerlevel10k)* ]] }
is-theme-starship() { [[ "$ZSH_THEME" == starship* ]] }

#
# Libs
#

# Load things from lib.
for zlib in $ZDOTDIR/lib/*.zsh; source $zlib
unset zlib

# Add more zsh config here, or in conf.d...
# ...
if [[ "$(uname)" == "Darwin" ]]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
elif [[ "$(uname)" == "Linux" ]]; then
  source $ZDOTDIR/functions/ghsrc
  source /home/dakota/scripts/rsync.zsh
  source /opt/aocc/setenv_AOCC.sh
  source /usr/bin/aws_zsh_completer.sh
  source /usr/share/clang/bash-autocomplete.sh
  source /home/dakota/.config/broot/launcher/bash/br
  # source $ZDOTDIR/functions/zet
fi

#
# Aliases
#
[[ -r ${ZDOTDIR:-$HOME}/.zaliases ]] && source ${ZDOTDIR:-$HOME}/.zaliases

#
# Completions
#

# Uncomment to manually initialize completion system, or let Zephyr
# do it automatically in the zshrc-post hook.
# ZSH_COMPDUMP=${XDG_CACHE_HOME:-$HOME/.cache}/zsh/compdump
# [[ -d $ZSH_COMPDUMP:h ]] || mkdir -p $ZSH_COMPDUMP:h
# autoload -Uz compinit && compinit -i -d $ZSH_COMPDUMP

#
# Prompt
#

# Uncomment to manually set your prompt, or let Zephyr do it automatically in the
# zshrc-post hook. Note that some prompts like powerlevel10k may not work well
# with post_zshrc.
setopt prompt_subst
autoload -Uz promptinit && promptinit
prompt "$ZSH_THEME[@]"

#
# Wrap up
#

# Manually call post_zshrc to bypass the hook
(( $+functions[run_post_zshrc] )) && run_post_zshrc

# Finish profiling by calling zprof.
[[ "$ZPROFRC" -eq 1 ]] && zprof
[[ -v ZPROFRC ]] && unset ZPROFRC

# Always return success
true
