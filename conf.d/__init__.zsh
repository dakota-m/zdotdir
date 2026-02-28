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
  $XDG_PROJECTS_DIR/dakota-m(N/)
  $cdpath
)

# Set the list of directories that Zsh searches for programs.
path=(
  # core
  $prepath
  $path

  # apps
  /bin(N)
  /{usr/local,opt}/opt/ruby/bin(N)
  /{usr/local,opt}/lib/ruby/gems/*/bin(N)
  /{usr/local,opt}/bin(N)
  /{usr/local,opt}/sbin(N)
  /usr/sbin(N)
  /opt/*(N)
  /opt/*/bin(N)
)

# vim: ft=sh ts=2 sw=2 et
