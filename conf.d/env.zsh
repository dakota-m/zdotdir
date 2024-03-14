#!/bin/zsh
#
# env: Set environment variables for interactive shells.
#

# Apps
export EDITOR=nvim
export VISUAL=nvim
export PAGER=nvimpager

# Set the list of directories that cd searches.
cdpath=(
  $XDG_PROJECTS_DIR(N/)
  $XDG_PROJECTS_DIR/mattmc3(N/)
  $cdpath
)

# Set the list of directories that Zsh searches for programs.
path=(
  # core
  $path

  # apps
  /{usr/local,opt/homebrew}/opt/curl/bin(N)
  /{usr/local,opt/homebrew}/opt/go/libexec/bin(N)
  /{usr/local,opt/homebrew}/share/npm/bin(N)
  /{usr/local,opt/homebrew}/opt/ruby/bin(N)
  /{usr/local,opt/homebrew}/lib/ruby/gems/*/bin(N)
  /{usr/local,opt}/bin(N)
  $HOME/.gem/ruby/*/bin(N)
)
