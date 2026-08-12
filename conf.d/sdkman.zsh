# Lazy-load SDKMAN on first sdk/sd command use.
export SDKMAN_DIR="${SDKMAN_DIR:-$HOME/.sdkman}"

__sdkman_lazy_init() {
  unset -f sdk sd __sdkman_lazy_init
  [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] || return 1
  source "$SDKMAN_DIR/bin/sdkman-init.sh"
}

sdk() {
  __sdkman_lazy_init || return 1
  sdk "$@"
}

# Optional convenience alias used by some setups
sd() {
  __sdkman_lazy_init || return 1
  sdk "$@"
}
