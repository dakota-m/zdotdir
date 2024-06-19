#!/bin/zsh
#
# .zshrc - Run on interactive Zsh session.
#

# If you are using Powerlevel10k prompt, and want to use instant prompt, uncomment this.
# Enable Powerlevel10k instant prompt. Should stay close to the top of .zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load all the kickstart.zsh libs.
for _zrc in $ZDOTDIR/lib/*.zsh; source $_zrc; unset _zrc

# Add more zsh config here, or in conf.d...
# ...
# source $ZDOTDIR/functions/ghsrc
# source /home/dakota/scripts/rsync.zsh
# source /opt/aocc/setenv_AOCC.sh
# source /usr/bin/aws_zsh_completer.sh
# source /usr/share/clang/bash-autocomplete.sh
# source /home/dakota/.config/broot/launcher/bash/br

# Uncomment to manually initialize completion system if you want, or let kickstart.zsh
# do it automatically.
# ZSH_COMPDUMP=${XDG_CACHE_HOME:-$HOME/.cache}/zsh/compdump
# [[ -d $ZSH_COMPDUMP:h ]] || mkdir -p $ZSH_COMPDUMP:h
# autoload -Uz compinit && compinit -i -d $ZSH_COMPDUMP

# Uncomment to manually set your prompt, or let kickstart.zsh do it automatically.
autoload -Uz promptinit && promptinit
# prompt p10k mmc
# prompt starship starship

# IMPORTANT: Run zshrc-post at the very end of your .zshrc. If you don't, kickstart.zsh
# will try to run it for you via a precmd hook, which might work fine, but might
# cause problems with certain plugins/prompts (eg: Powerlevel10k).
zshrc-post

# HACK: - Recommended: call p10k finalize at the end of ~/.config/zsh/.zshrc.
    # You can do this by running the following command:
    #
    #   echo '(( ! ${+functions[p10k]} )) || p10k finalize' >>! ~/.config/zsh/.zshrc
    #
    # * You will not see this error message again.
    # * Zsh will start quickly and without prompt flickering.
# (( ! ${+functions[p10k]} )) || p10k finalize

# TODO: not overriding fzf plugin defaults
# export FZF_DEFAULT_OPTS="--layout=reverse \
# --info=inline \
# --height=80% \
# --multi \
# --preview='([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tre -c {} | less)) || echo {} 2>/dev/null | head -n 200' \
# --preview-window=':hidden' \
# --color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008' \
# --prompt='∼ ' \
# --pointer='▶' \
# --marker='✓' \
# --bind '?:toggle-preview' \
# --bind 'ctrl-a:select-all' \
# --bind 'ctrl-e:execute(nvim {+} >/dev/tty)' \
# --bind 'ctrl-v:execute(code {+})' \
# --bind 'ctrl-y:execute-silent(echo {+} | pbcopy')"
