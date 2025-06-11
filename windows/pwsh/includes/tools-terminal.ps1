#------------------------------------------------------------------------------
# Stuff related to terminal Software
#
# - alias
# - simple initialization
# - environment variables
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# Zoxide
# https://github.com/ajeetdsouza/zoxide
#------------------------------------------------------------------------------
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# LazyGit
Set-Alias -Value lazygit -Name lg

# vim: set ft=ps1 ts=4 sts=4 sw=4 noet :