#
# Antidote - Dynamic (inline bundles with antidote init)
#
# Uses `antidote init` for dynamic bundle loading.
# More flexible: supports post-hooks, using directives, kind specifiers, pin SHAs.
# Slightly slower startup than static bundles but no separate .zsh_plugins.txt needed.
#

: ${ANTIDOTE_HOME:=${XDG_CACHE_HOME:-~/.cache}/repos}
ANTIDOTE_REPO=$ANTIDOTE_HOME/mattmc3/antidote

# Clone antidote if necessary.
if [[ ! -d $ANTIDOTE_REPO ]]; then
  git clone https://github.com/mattmc3/antidote $ANTIDOTE_REPO
fi

source $ANTIDOTE_REPO/antidote.zsh

source <(antidote init)

# Init
antidote bundle "mattmc3/zephyr path:plugins/history"
antidote bundle "mattmc3/zephyr path:plugins/environment"
antidote bundle "mattmc3/zephyr path:plugins/homebrew conditional:is-macos"

# Completions
antidote bundle "mattmc3/ez-compinit"
antidote bundle "zsh-users/zsh-completions kind:fpath path:src"

# Editor
antidote bundle "mattmc3/zephyr path:plugins/editor"
antidote bundle "jeffreytse/zsh-vi-mode"
antidote bundle "$ZDOTDIR/lib/zsh-no-ps2.zsh"
antidote bundle "wazum/zsh-directory-dot-expansion"

# Prompts
antidote bundle "mattmc3/zephyr path:plugins/prompt"

# Clipboard
antidote bundle "ohmyzsh/ohmyzsh path:lib/clipboard.zsh"
antidote bundle "ohmyzsh/ohmyzsh path:plugins/copypath"
antidote bundle "ohmyzsh/ohmyzsh path:plugins/copybuffer"
antidote bundle "ohmyzsh/ohmyzsh path:plugins/copyfile"

# Misc
antidote bundle "mattmc3/zephyr path:plugins/color"
antidote bundle "mattmc3/zephyr path:plugins/directory"
antidote bundle "mattmc3/zephyr path:plugins/utility"
antidote bundle "$ZDOTDIR/plugins/git"
antidote bundle "$ZDOTDIR/plugins/abbreviations"
antidote bundle "$ZDOTDIR/plugins/fzf"
# antidote bundle "matthieusb/zsh-sdkman"

# OMZ
antidote bundle "ohmyzsh/ohmyzsh path:plugins/direnv"
antidote bundle "ohmyzsh/ohmyzsh path:plugins/extract"
antidote bundle "ohmyzsh/ohmyzsh path:plugins/kubectl"

# Utils
antidote bundle "romkatv/zsh-bench kind:path"
antidote bundle "unixorn/fzf-zsh-plugin kind:defer"
antidote bundle "aloxaf/fzf-tab kind:defer"
antidote bundle "mattmc3/zman"

# macOS
antidote bundle "mattmc3/zephyr path:plugins/macos conditional:is-macos"
antidote bundle "thirteen37/fzf-brew"

# Final
antidote bundle "zdharma-continuum/fast-syntax-highlighting kind:defer"
antidote bundle "zsh-users/zsh-autosuggestions"
antidote bundle "zdharma-continuum/history-search-multi-word kind:defer"
