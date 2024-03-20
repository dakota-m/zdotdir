#
# __init__: This runs prior to any other conf.d contents.
#

# Apps
export EDITOR=nvim
export VISUAL=nvim
export PAGER=nvimpager

# Set the list of directories that cd searches.
cdpath=(
  $XDG_PROJECTS_DIR(N/)
  # $XDG_PROJECTS_DIR/mattmc3(N/)
  $cdpath
)

# Set the list of directories that Zsh searches for programs.
path=(
  # core
  $path

  # apps
  # /{usr/local,opt/homebrew}/opt/curl/bin(N)
  # /{usr/local,opt/homebrew}/opt/go/libexec/bin(N)
  # /{usr/local,opt/homebrew}/share/npm/bin(N)
  # /{usr/local,opt/homebrew}/opt/ruby/bin(N)
  # /{usr/local,opt/homebrew}/lib/ruby/gems/*/bin(N)
  /{usr/local,opt}/bin(N)
  /opt/*(N)
  /opt/*/bin(N)
)

# macOS
if [[ "$OSTYPE" == darwin* ]]; then
  # Make Apple Terminal behave.
  export SHELL_SESSIONS_DISABLE=1
fi

# Enable less wait time between key presses.
# export KEYTIMEOUT=1

# Use `< file` to quickly view the contents of any file.
[[ -z "$READNULLCMD" ]] || READNULLCMD=$PAGER
