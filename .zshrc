#!/bin/zsh
#
# .zshrc - Run on interactive Zsh session.
#

# Initialize profiling.
[[ "$ZPROFRC" -ne 1 ]] || zmodload zsh/zprof
alias zprofrc="ZPROFRC=1 zsh"

# Load .zstyles file first.
[[ -r ${ZDOTDIR:-$HOME}/.zstyles ]] && source ${ZDOTDIR:-$HOME}/.zstyles

# Load things from lib.
for zlib in antidote; do
  source $ZDOTDIR/lib/${zlib}.zsh
done
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

# Add aliases.
[[ -r ${ZDOTDIR:-$HOME}/.zaliases ]] && source ${ZDOTDIR:-$HOME}/.zaliases

# Uncomment to manually initialize completion system if you want, or let Zephyr
# do it automatically in the zshrc-post hook.
# ZSH_COMPDUMP=${XDG_CACHE_HOME:-$HOME/.cache}/zsh/compdump
# [[ -d $ZSH_COMPDUMP:h ]] || mkdir -p $ZSH_COMPDUMP:h
# autoload -Uz compinit && compinit -i -d $ZSH_COMPDUMP

# Uncomment to manually set your prompt, or let Zephyr do it automatically in the
# zshrc-post hook. Note that some prompts like powerlevel10k may not work well
# with post_zshrc.
() {
  autoload -Uz promptinit && promptinit
  local -a prompt_argv
  zstyle -a ':zephyr:plugin:prompt' theme 'prompt_argv' || return 1
  prompt $prompt_argv
}

# Finish profiling by calling zprof.
[[ "$ZPROFRC" -eq 1 ]] && zprof
[[ -v ZPROFRC ]] && unset ZPROFRC
true
