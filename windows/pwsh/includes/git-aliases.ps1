#------------------------------------------------------------------------------
# GIT aliases missing in the plugin
#------------------------------------------------------------------------------

function _git_worktree {
    $cmd = switch($MyInvocation.InvocationName) {
        gwtls { 'list' }
        gwtmv { 'move' }
        gwtrm { 'remove' }
    }
    git worktree $cmd $args
}
Set-Alias -Value _git_worktree -Name gwt
Set-Alias -Value _git_worktree -Name gwtls
Set-Alias -Value _git_worktree -Name gwtmv
Set-Alias -Value _git_worktree -Name gwtrm

# vim: set ft=ps1 ts=4 sts=4 sw=4 et :
