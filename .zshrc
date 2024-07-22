#!/bin/zsh
#
# .zshrc - Run on interactive Zsh session.
#

# Initialize profiling.
[[ "$ZPROFRC" -ne 1 ]] || zmodload zsh/zprof
alias zprofrc="ZPROFRC=1 zsh"

# Load .zstyles file first.
[[ -r ${ZDOTDIR:-$HOME}/.zstyles ]] && source ${ZDOTDIR:-$HOME}/.zstyles

# Load everything from lib.
for _zrc in $ZDOTDIR/lib/*.zsh; source $_zrc; unset _zrc

# Add more zsh config here, or in conf.d...
# ...
source $ZDOTDIR/functions/ghsrc
source /home/dakota/scripts/rsync.zsh
source /opt/aocc/setenv_AOCC.sh
source /usr/bin/aws_zsh_completer.sh
source /usr/share/clang/bash-autocomplete.sh
source /home/dakota/.config/broot/launcher/bash/br
# source $ZDOTDIR/functions/zet

# Add aliases.
[[ -r ${ZDOTDIR:-$HOME}/.zaliases ]] && source ${ZDOTDIR:-$HOME}/.zaliases

# Uncomment to manually initialize completion system if you want, or let zshrc-post
# do it automatically.
# ZSH_COMPDUMP=${XDG_CACHE_HOME:-$HOME/.cache}/zsh/compdump
# [[ -d $ZSH_COMPDUMP:h ]] || mkdir -p $ZSH_COMPDUMP:h
# autoload -Uz compinit && compinit -i -d $ZSH_COMPDUMP

# Uncomment to manually set your prompt, or let zshrc-post do it automatically.
autoload -Uz promptinit && promptinit
# prompt p10k mmc
prompt starship starship

# Finish profiling by calling zprof.
[[ "$ZPROFRC" -eq 1 ]] && zprof
[[ -v ZPROFRC ]] && unset ZPROFRC
true
