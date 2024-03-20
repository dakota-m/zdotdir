#!/bin/zsh

function yfz () {
  if command -v yay &> /dev/null; then
    yay -slaq
  fi
}
