#------------------------------------------------------------------------------
# Eza - A modern replacement for ls.
# https://github.com/eza-community/eza
#------------------------------------------------------------------------------

# Alias for ls's with eza
# necessary since eza does not resolve "~" to $HOME/$env:USERPROFILE
function _eza {
    if ($args.Count -gt 0) {
        $path = $args[-1].ToString()
        if ($path.StartsWith('~')) {
            $args[-1] = $path.replace('~', $HOME)
        }
    }
    switch ($MyInvocation.InvocationName) {
        ls { eza $args }
        ll { eza -l $args }
        la { eza -a $args }
    }
}
Set-Alias -Value _eza -Name ls
Set-Alias -Value _eza -Name ll
Set-Alias -Value _eza -Name la

# vim: set ft=ps1 ts=4 sts=4 sw=4 noet :