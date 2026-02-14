# vim: set ft=sh ts=4 sw=4 :

# fnm
export PATH="$HOME/.local/share/fnm:$PATH"
eval "`fnm env`"

# UV astral
export UV_NATIVE_TLS=true
eval "$(uv generate-shell-completion zsh)"
alias pip='echo use\: \"uv pip\" instead.'

# fnm
PATH="$HOME/.local/share/fnm:$PATH"
eval "$(fnm env)"

