#
# xdg - don't pollute home
#

# XDG basedirs

export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share
export XDG_STATE_HOME=~/.local/state
# export XDG_RUNTIME_DIR=~/.xdg
export XDG_PROJECTS_DIR=~/Projects

# for _xdgdir in XDG_{CONFIG,CACHE,DATA,STATE}_HOME XDG_RUNTIME_DIR; do
for _xdgdir in XDG_{CONFIG,CACHE,DATA,STATE}_HOME; do
  [[ -e ${(P)_xdgdir} ]] || mkdir -p ${(P)_xdgdir}
done
unset _xdgdir

# xdg aliases
alias data='cd $XDG_DATA_HOME'
alias cache='cd $XDG_CACHE_HOME'
alias proj='cd $XDG_PROJECTS_DIR'

#
# Shell utils
#

# less
export LESSKEY="${LESSKEY:-$XDG_CONFIG_HOME/less/lesskey}"
export LESSHISTFILE="${LESSHISTFILE:-$XDG_CACHE_HOME/less/history}"

# readline
# export INPUTRC="${INPUTRC:-$XDG_CONFIG_HOME/readline/inputrc}"

# screen
# export SCREENRC="${SCREENRC:-$XDG_CONFIG_HOME/screen/screenrc}"

# tmux
# export TMUX_CONFIG="${TMUX_CONFIG:-$XDG_CONFIG_HOME/tmux/tmux.conf}"
# alias tmux="${aliases[tmux]:-tmux} -f \"\$TMUX_CONFIG\""

# wget
# export WGETRC="${WGETRC:-$XDG_CONFIG_HOME/wget/wgetrc}"
# alias wget="${aliases[wget]:-wget} --hsts-file=\$XDG_CACHE_HOME/wget/wget-hsts"

#
# Dev tools
#

# gpg
# export GNUPGHOME="${GNUPGHOME:-$XDG_DATA_HOME/gnupg}"
# alias gpg="${aliases[gpg]:-gpg} --homedir \"\$GNUPGHOME\""

# asdf
# if (( $+commands[asdf] )); then
#   if [[ ! -d $XDG_CONFIG_HOME/asdf ]]; then
#     mkdir -p $XDG_CONFIG_HOME/asdf
#   elif [[ ! -d $XDG_DATA_HOME/asdf ]]; then
#     mkdir -p $XDG_DATA_HOME/asdf
#   fi
  # export ASDF_CONFIG_FILE="${ASDF_CONFIG_FILE:-$XDG_CONFIG_HOME/asdf/.asdfrc}"
  # export ASDF_DIR="${ASDF_DIR:-$XDG_CONFIG_HOME/asdf}"
  # export ASDF_DIR="${ASDF_DIR:-/opt/asdf-vm}"
  # export ASDF_DATA_DIR="${ASDF_DATA_DIR:-$XDG_DATA_HOME/asdf}"
  # export ASDF_CONCURRENCY="${ASDF_CONCURRENCY:-$(nproc --ignore=2)}"
# fi

# groovy
if [[ "$OSTYPE" == darwin* ]]; then
  export GROOVY_HOME=$HOMEBREW_PREFIX/opt/groovy/libexec  # per homebrew
  export GROOVY_TURN_OFF_JAVA_WARNINGS="true"
fi

# jupyter
# export JUPYTER_CONFIG_DIR="${JUPYTER_CONFIG_DIR:-$XDG_CONFIG_HOME/jupyter}"

# node
path+=(
  /{opt/homebrew,usr/local}/share/npm/bin(N)
)
export NPM_CONFIG_USERCONFIG="${NPM_CONFIG_USERCONFIG:-$XDG_CONFIG_HOME/npm/npmrc}"
export NODE_REPL_HISTORY="${NODE_REPL_HISTORY:-$XDG_DATA_HOME/nodejs/repl_history}"

# nuget
# export NUGET_PACKAGES="${NUGET_PACKAGES:-$XDG_CACHE_HOME/NuGetPackages}"

# postgres
# export PSQLRC="${PSQLRC:-$XDG_CONFIG_HOME/pg/psqlrc}"
# export PSQL_HISTORY="${PSQL_HISTORY:-$XDG_CACHE_HOME/pg/psql_history}"
# export PGPASSFILE="${PGPASSFILE:-$XDG_CONFIG_HOME/pg/pgpass}"
# export PGSERVICEFILE="${PGSERVICEFILE:-$XDG_CONFIG_HOME/pg/pg_service.conf}"

# ruby bundler
export BUNDLE_USER_CONFIG="${BUNDLE_USER_CONFIG:-$XDG_CONFIG_HOME/bundle}"
export BUNDLE_USER_CACHE="${BUNDLE_USER_CACHE:-$XDG_CACHE_HOME/bundle}"
export BUNDLE_USER_PLUGIN="${BUNDLE_USER_PLUGIN:-$XDG_DATA_HOME/bundle}"

# ruby gems
export GEM_HOME="${GEM_HOME:-$XDG_DATA_HOME/gem}"
export GEM_SPEC_CACHE="${GEM_SPEC_CACHE:-$XDG_CACHE_HOME/gem}"

# rust
export CARGO_HOME="${CARGO_HOME:-$XDG_DATA_HOME/cargo}"
export RUSTUP_HOME="${RUSTUP_HOME:-$XDG_DATA_HOME/rustup}"

# skim
export SKIM_DEFAULT_COMMAND="fd --color=auto --type file --exclude={.git,.idea,.vscode,pkg,node_modules,vendor,bin,build} --hidden --follow . $HOME"

# fzf
# unset FZF_DEFAULT_OPTS
# fzf_default_opts+=(
#   "--layout=reverse"
#   "--info=inline"
#   "--height=80%"
#   "--multi"
#   "--preview='${FZF_PREVIEW}'"
#   "--preview-window='${FZF_PREVIEW_WINDOW}'"
#   "$FZF_COLOR_SCHEME"
#   "--prompt='∼ '"
#   "--pointer='▶'"
#   "--marker='✓'"
#   "--bind '?:toggle-preview'"
#   "--bind 'ctrl-a:select-all'"
#   "--bind 'ctrl-e:execute(nvim {+} >/dev/tty)'"
#   "--bind 'ctrl-v:execute(code {+})'"
#   "--bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'"
# )
# export FZF_DEFAULT_OPTS=$(printf '%s\n' "${fzf_default_opts[@]}")
