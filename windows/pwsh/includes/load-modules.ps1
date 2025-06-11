###############################################################################
# POWERSHELL MODULES
###############################################################################
# https://www.powershellgallery.com
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# Choco completions
#------------------------------------------------------------------------------
# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
#------------------------------------------------------------------------------
#$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
#if (Test-Path($ChocolateyProfile)) {
#    Import-Module "$ChocolateyProfile"
#}

#------------------------------------------------------------------------------
# Git modules
#------------------------------------------------------------------------------
# https://github.com/gluons/powershell-git-aliases
Import-Module git-aliases -DisableNameChecking
# https://github.com/kzrnm/git-completion-pwsh
# Import-Module git-completion

#------------------------------------------------------------------------------
# Docker completions
# https://github.com/matt9ucci/DockerCompletion
# Import-Module DockerCompletion

#------------------------------------------------------------------------------
# CommandNotFound
# This module is installed by Microsfoft PowerToys or manually from:
# https://www.powershellgallery.com/packages/Microsoft.WinGet.CommandNotFound
#------------------------------------------------------------------------------
Import-Module -Name Microsoft.WinGet.CommandNotFound

# vim: set ft=ps1 ts=4 sts=4 sw=4 noet :