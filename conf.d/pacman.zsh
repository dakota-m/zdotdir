#!/bin/zsh

# INFO:
# source: https://wiki.archlinux.org/title/Zsh
# pacman hook for rehashing completions
#

# export MAKEFLAGS=

# zshcache_time="$(date +%s%N)"
#
# autoload -Uz add-zsh-hook
#
# rehash_precmd() {
#   if [[ -a /var/cache/zsh/pacman ]]; then
#     local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
#     if (( zshcache_time < paccache_time )); then
#       rehash
#       zshcache_time="$paccache_time"
#     fi
#   fi
# }
#
# add-zsh-hook -Uz precmd rehash_precmd
