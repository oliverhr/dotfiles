#------------------------------------------------------------------------------
# Fuzzyfinder fzf
# https://github.com/junegunn/fzf
# https://www.powershellgallery.com/packages/PSFzf
#------------------------------------------------------------------------------
Set-PsFzfOption `
    -PSReadlineChordProvider 'Ctrl+t' <# keyboard shortcut to start a search #>`
    -PSReadlineChordReverseHistory 'Ctrl+r' <# shortcut to search on history #>`
    -EnableAliasFuzzyEdit <# Enable command: fe #>
    #-EnableAliasFuzzySetLocation <# diasbled since got installed fd from scoop #>

# Search with Fuzzy finder -> Vim
function _vim_fzf {
    Get-ChildItem . -Recurse -Attributes !Directory | Invoke-Fzf | % { vim $_  }
}
Set-Alias -Name edit -Value _vim_fzf

# vim: set ft=ps1 ts=4 sts=4 sw=4 et :