#
# secrets - Load sensitive env vars from a GPG-encrypted store.
#
# Plaintext never lives in git. Encrypted store: $ZDOTDIR/.secrets.zsh.asc
# (encrypted to GPG key 742874D6CC49E3BD - "Dakota Martin (VA-Github)").
#
# To view/edit secrets:
#   gpg -dq $ZDOTDIR/.secrets.zsh.asc > $ZDOTDIR/secrets.local.zsh   # gitignored
#   $EDITOR $ZDOTDIR/secrets.local.zsh
#   gpg --yes -r 742874D6CC49E3BD -ao $ZDOTDIR/.secrets.zsh.asc --encrypt $ZDOTDIR/secrets.local.zsh
#   rm -f $ZDOTDIR/secrets.local.zsh
#
# Loaded on interactive shells only (conf.d). gpg-agent caches the passphrase,
# so you are prompted at most once per agent lifetime.
#

_secrets_enc="${ZDOTDIR:-$HOME/.config/zsh}/.secrets.zsh.asc"
if [[ -r "$_secrets_enc" ]] && (( $+commands[gpg] )); then
  source <(gpg --quiet --decrypt "$_secrets_enc" 2>/dev/null)
fi
unset _secrets_enc
