oh-my-posh init pwsh --config "$env:USERPROFILE\AppData\Local\Programs\oh-my-posh\themes\robbyrussell.omp.json" | Invoke-Expression

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Set alias
Function _touch {
  New-Item -ItemType "File" -Path ($args[0])
}
Set-Alias -Name touch -Value _touch

# Alias for start to open like macos
Set-Alias -Name open -Value Start-Process

# Git module
Import-Module git-aliases -DisableNameChecking


