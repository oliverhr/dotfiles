oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\robbyrussell.omp.json" | Invoke-Expression

# $PSReadLineOptions = @{
#     HistoryNoDuplicates = $true
#     HistorySearchCursorMovesToEnd = $true
# }
# Set-PSReadLineOption @PSReadLineOptions

#------------------------------------------------------------------------------
# IMPORT POWERSHELL MODULES
#------------------------------------------------------------------------------
# https://www.powershellgallery.com
#------------------------------------------------------------------------------

# ---------------------------
# Choco completions
# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# ---------------------------
# Git module
# https://github.com/gluons/powershell-git-aliases
Import-Module git-aliases -DisableNameChecking

# ---------------------------
# Docker completions
# https://github.com/matt9ucci/DockerCompletion
Import-Module DockerCompletion

#------------------------------------------------------------------------------
# My Custom Stuff
#------------------------------------------------------------------------------

# Set alias for touch, since now is not a default alias included in pwsh
Function _touch {
  New-Item -ItemType "File" -Path ($args[0])
}
Set-Alias -Name touch -Value _touch

# Alias for start to open like macos
Set-Alias -Name open -Value Start-Process


