#!/bin/zsh
#
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/usr/bin/aws_completer' aws

# source /usr/bin/aws_zsh_completer.sh

# complete -C '/usr/local/bin/aws_completer' aws

# if command -v aws_completer; then
#   if [ -f /usr/bin/aws_completer ]; then
#     complete -C '/usr/bin/aws_completer' aws
#   fi
# fi
