#
# Load plugins via Zephyr.
#

ZEPHYR_HOME=$ZDOTDIR/.zephyr
[[ -d "$ZEPHYR_HOME" ]] || git clone git@github.com:mattmc3/zephyr "$ZEPHYR_HOME"

plugins=(
  # core
  zfunctions
  environment
  colors
  directory
  editor
  history
  utility

  # plugins
  autosuggestions
  clipboard
  macos
  python
  string
  sudo
  z

  # omz plugins
  extract
  fancy-ctrl-z
  magic-enter
  sudo

  # load last
  abbreviations
  zopts
  #prompt
  completions
  syntax-highlighting
  history-substring-search
)
source $ZEPHYR_HOME/zephyr.zsh

# Set prompt.
source $ZEPHYR_HOME/.external/powerlevel10k/powerlevel10k.zsh-theme
source $ZDOTDIR/lib/p10k.zsh

# Set completion style.
compstyle zephyr

# Use Emacs keys.
bindkey -e

# Set plugin variables.
MAGIC_ENTER_GIT_COMMAND='git status -sb'
if [[ "$OSTYPE" == darwin* ]]; then
  MAGIC_ENTER_OTHER_COMMAND='command ls -G'
else
  MAGIC_ENTER_OTHER_COMMAND='command ls --color=auto'
fi