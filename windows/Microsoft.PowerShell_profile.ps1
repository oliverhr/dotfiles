###########################################################
# Powershell profile
###########################################################
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\robbyrussell.omp.json" | Invoke-Expression

#------------------------------------------------------------------------------
# Control how the history is being managed
#------------------------------------------------------------------------------
$PSReadLineHistoryHandler = {
    Param([string]$line)
    $patterns = @(
        'clear',
        'exit',
        '^ls',
        '^cd\s'
        '^rm\s',
        '^touch\s',
        '^vim\s',
        '^git\s',
        '^g[sa][ta]$',
        '^gsw',
        '^g[acfldp]$'
    )
    return !($line -match ($patterns -join '|'))
}
$PSReadLineOptions = @{
    HistoryNoDuplicates = $false
    HistorySearchCursorMovesToEnd = $true
    AddToHistoryHandler = $PSReadLineHistoryHandler
}
Set-PSReadLineOption @PSReadLineOptions

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

#------------------------------------------------------------------------------
# IMPORT POWERSHELL MODULES
#------------------------------------------------------------------------------
# https://www.powershellgallery.com
#------------------------------------------------------------------------------

# ---------------------------
# Git module
# https://github.com/gluons/powershell-git-aliases
Import-Module git-aliases -DisableNameChecking

# ---------------------------
# Docker completions
# https://github.com/matt9ucci/DockerCompletion
Import-Module DockerCompletion

# ---------------------------
# Fuzzyfinder fzf
Set-PsFzfOption `
    -PSReadlineChordProvider 'Ctrl+t' <# keyboard shortcut to start a search #>`
    -PSReadlineChordReverseHistory 'Ctrl+r' <# shortcut to search on history #>`
    -EnableAliasFuzzySetLocation <# enable command: fd #>`
    -EnableAliasFuzzyEdit <# Enable command: fe #>

#------------------------------------------------------------------------------
# Custom Stuff
#------------------------------------------------------------------------------
# Set alias for some used unix commands
# Alias for start to open like macos
Set-Alias -Name open -Value Start-Process

# Touch, since now is not a default alias included in pwsh
Function _touch {
    New-Item -ItemType "File" -Path ($args[0])
}
Set-Alias -Name touch -Value _touch

# which
Function _which {
    Get-Command -Name ($args[0]) | Format-Table -Autosize -Property Version, Source
}
Set-Alias -Name which -Value _which

Function _ll {
    get-ChildItem ($args[0]) | Format-Wide -Column 5
}
Set-Alias -Name ll -Value _ll

# Search with Fuzzy finder -> Vim
Function _vim_fzf {
    Get-ChildItem . -Recurse -Attributes !Directory | Invoke-Fzf | % { vim $_  }
}
Set-Alias -Name edit -Value _vim_fzf

#Jetbrains IDE (eg. pycharm)
Function _pycharm {
    Start-Process `
        -FilePath 'C:\Program Files\JetBrains\PyCharm 2024.3.4\bin\pycharm64.exe' `
        -ArgumentList "nosplash","dontReopenProjects", ($args[0])
}
Set-Alias -Name pycharm -Value _pycharm

# https://poshcode.gitbook.io/powershell-practice-and-style/style-guide/code-layout-and-formatting
# vim: set ft=ps1 ts=4 sts=4 sw=4 et
