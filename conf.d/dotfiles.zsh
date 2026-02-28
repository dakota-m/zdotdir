# dotfiles
: ${DOTFILES:=$HOME/.config}
alias dotf='cd "$DOTFILES"'
alias dotfed='cd "$DOTFILES" && ${VISUAL:-${EDITOR:-vim}} .'
alias fconf=fdot
alias zdot='cd $ZDOTDIR'
