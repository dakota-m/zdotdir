#
# __init__: This runs prior to any other conf.d contents.
#

# Apps
export EDITOR=nvim
export VISUAL=nvim
export PAGER=nvimpager

export MAKEFLAGS="-j$(nproc --ignore=2)"

# Set the list of directories that cd searches.
cdpath=(
  $XDG_PROJECTS_DIR(N/)
  $XDG_PROJECTS_DIR/dakota-m(N/)
  # $XDG_PROJECTS_DIR/mattmc3(N/)
  $cdpath
)

# Set the list of directories that Zsh searches for programs.
path=(
  # core
  $path

  # apps
  /bin(N)
  /{usr/local,opt}/opt/ruby/bin(N)
  /{usr/local,opt}/lib/ruby/gems/*/bin(N)
  /{usr/local,opt}/bin(N)
  /opt/*(N)
  /opt/*/bin(N)

  # keg only brew apps
  $HOMEBREW_PREFIX/opt/curl/bin(N)
  $HOMEBREW_PREFIX/opt/go/libexec/bin(N)
  $HOMEBREW_PREFIX/share/npm/bin(N)
  $HOMEBREW_PREFIX/opt/ruby/bin(N)
  $HOMEBREW_PREFIX/lib/ruby/gems/*/bin(N)
  $HOME/.gem/ruby/*/bin(N)
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
