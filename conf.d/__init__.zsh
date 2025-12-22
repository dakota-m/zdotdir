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
  # /bin(N)
  # /{usr/local,opt}/bin(N)
  # /{usr/local,opt}/sbin(N)
  # /usr/sbin(N)
  # /opt/*(N)
  # /opt/*/bin(N)
  # /home/dakota/.asdf/shims(N)
  /Applications/WezTerm.app/Contents/MacOS
  /Users/dakotamartin/.sdkman/candidates/gradle/*/bin(N)
  /Users/dakotamartin/.sdkman/candidates/java/*/bin(N)
  /Users/dakotamartin/.sdkman/candidates/maven/*/bin(N)

  # keg only brew apps
  $HOMEBREW_PREFIX/bin(N)
  $HOMEBREW_PREFIX/opt/*/bin(N)
  $HOMEBREW_PREFIX/opt(N)
  # $HOMEBREW_PREFIX/opt/openjdk/bin(N)
  # $HOMEBREW_PREFIX/opt/curl/bin(N)
  # $HOMEBREW_PREFIX/opt/go/libexec/bin(N)
  # $HOMEBREW_PREFIX/share/npm/bin(N)
  # $HOMEBREW_PREFIX/opt/ruby/bin(N)
  # $HOMEBREW_PREFIX/lib/ruby/gems/*/bin(N)
  # $HOME/.gem/ruby/*/bin(N)
)

# vim: ft=sh ts=2 sw=2 et
