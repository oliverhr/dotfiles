# ----------------------------------------------------------------------------
# My custom functions for
# Friendly Interactive SHell
# ----------------------------------------------------------------------------

function ed
    vim (fzf --height 50% --reverse --preview "bat --color=always --style=numbers --line-range=:500 {}")
end

