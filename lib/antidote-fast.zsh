#
# Antidote - Fast (static bundle generation)
#
# Generates a static .zsh file from .zsh_plugins.txt on first run or when plugins change.
# Subsequent shell starts just source that file — no antidote parsing overhead.
#

: ${ANTIDOTE_HOME:=${XDG_CACHE_HOME:-~/.cache}/repos}
ANTIDOTE_REPO=$ANTIDOTE_HOME/mattmc3/antidote

# Clone antidote if necessary.
if [[ ! -d $ANTIDOTE_REPO ]]; then
  git clone https://github.com/mattmc3/antidote $ANTIDOTE_REPO
fi

# Set the root name of the plugins files (.txt and .zsh) antidote will use.
zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins

# Ensure the .zsh_plugins.txt file exists so you can add plugins.
[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

# Lazy-load antidote from its functions directory.
fpath=($ANTIDOTE_REPO/functions $fpath)
autoload -Uz antidote

# Generate a new static file whenever .zsh_plugins.txt is updated.
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi

# Source your static plugins file.
source ${zsh_plugins}.zsh

# Clean up
unset zsh_plugins
