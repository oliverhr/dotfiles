#------------------------------------------------------------------------------
# Aliases for common configuration files
#------------------------------------------------------------------------------

$env:EDITOR = 'vim'
function _open_with_editor {
    $target = switch ($MyInvocation.InvocationName) {
        confshell { $PROFILE }
        confvim   { "~/vimfiles/vimrc" }
        confgit   { "~/.config/git/" }
        checkhistory { (Get-PSReadLineOption).HistorySavePath }
    }
    $exp = "$($env:EDITOR) -R ""$($target)"""
    Invoke-Expression $exp
}
Set-Alias -Value _open_with_editor -Name confshell
Set-Alias -value _open_with_editor -Name confvim
Set-Alias -value _open_with_editor -Name confgit
Set-Alias -value _open_with_editor -Name checkhistory

# vim: set ft=ps1 ts=4 sts=4 sw=4 et :