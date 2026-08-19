# AOCC-optimized yay builds (opt-in). Auto-loaded from conf.d - no manual
# source needed. See ~/.config/pacman/makepkg-aocc.conf for the build profile.
#
# Usage: yay-aocc -S <package>   (builds using AMD AOCC clang, -march=native, -O3)
# Normal `yay` is untouched - only calls through these use AOCC.
yay-aocc() {
  MAKEPKG_CONF="$HOME/.config/pacman/makepkg-aocc.conf" yay "$@"
}

# Fuzzy-search AUR packages and install via yay-aocc. Same picker/preview as
# the `yfz` alias in .zaliases, but installs through yay-aocc instead of plain
# yay. Uses command substitution rather than xargs (like yfz does) because
# xargs forks a subprocess and can't see shell functions - only real PATH
# executables - so it would never find yay-aocc.
yfza() {
  local pkg
  pkg=$(yay -Slaq | sed -e "/installed/d" | $FZF_TOOL --ansi --preview "bat \
   | yay -Si {}" --preview-window "top,50%")
  [[ -n "$pkg" ]] && yay-aocc -S "$pkg"
}
