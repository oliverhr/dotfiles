<#
# Add this to the system $PROFILE file
$PWSH_CONFIG_DIR = "~/.config/pwsh"
$PROFILE="~/.config/pwsh/pwshrc.ps1"
. $PROFILE
#>
#------------------------------------------------------------------------------
# https://poshcode.gitbook.io/powershell-practice-and-style/style-guide/code-layout-and-formatting
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# Some unix tools require this path to be set
#------------------------------------------------------------------------------
# $env:XDG_CONFIG_HOME="$env:USERPROFILE/.config"
# $env:XDG_DATA_HOME="$env:LOCALAPPDATA"
# $env:XDG_STATE_HOME="$env:LOCALAPPDATA"
# $env:XDG_CACHE_HOME="$env:LOCALAPPDATA/Temp"

###############################################################################
# Custom Powershell profile
# -----------------------------------------------------------------------------
# More about powershell:
# https://poshcode.gitbook.io/powershell-practice-and-style/style-guide/code-layout-and-formatting
###############################################################################

$omptheme = 'robbyrussell'
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\$omptheme.omp.json" | Invoke-Expression

#------------------------------------------------------------------------------
# Control how the history is being managed
#------------------------------------------------------------------------------
$PSReadLineHistoryHandler = {
    Param([string]$line)
    $patterns = @(
        '^ls[\s]*', '^la[\s]*', '^ll[\s]*'
        '^cp[\s]'
        '^mv[\s]'
        '^mkdir[\s]'
        '^cd[\s]*'
        '^rm\s'
        '^cat[\s]', '^caet[\s]'
        '^touch[\s]'
        '^conf*', '^checkhistory'
        'exit', 'exot'
        '^[g]?vi[m]?', '^pycharm', '^code', '^npp'
        'clear', 'celar', 'claer'
        '^git\s', '^g[sa][ta]$', '^gsw', '^g[acfldp]$'
        '^:', '^\s'
        '\.\s\$PROFILE'
        '^[:word:].exe[\s]*'
    )
    return !($line -match ($patterns -join '|'))
}
$PSReadLineOptions = @{
    HistoryNoDuplicates = $true
    HistorySearchCursorMovesToEnd = $true
    AddToHistoryHandler = $PSReadLineHistoryHandler
}
Set-PSReadLineOption @PSReadLineOptions

#------------------------------------------------------------------------------
# Zoxide
# https://github.com/ajeetdsouza/zoxide
#------------------------------------------------------------------------------
Invoke-Expression (& { (zoxide init powershell | Out-String) })

#------------------------------------------------------------------------------
# Mise
# https://mise.jdx.dev/getting-started.html#activate-mise
#------------------------------------------------------------------------------
# Invoke-Expression (mise activate pwsh | Out-String)

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
Import-Module git-completion

#------------------------------------------------------------------------------
# Docker completions
# https://github.com/matt9ucci/DockerCompletion
#Import-Module DockerCompletion

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

#------------------------------------------------------------------------------
# CommandNotFound
# This module is installed by Microsfoft PowerToys or manually from:
# https://www.powershellgallery.com/packages/Microsoft.WinGet.CommandNotFound
#------------------------------------------------------------------------------
Import-Module -Name Microsoft.WinGet.CommandNotFound

###############################################################################
# Custom Alias
###############################################################################

# Alias for start to open like macos
Set-Alias -Name open -Value Start-Process

# LazyGit
Set-Alias -Value lazygit -Name lg

# Alias for ls's with eza
function _eza {
    switch ($MyInvocation.InvocationName) {
        ls { eza -G }
        ll { eza -l }
        la { eza -a }
    }
}
Set-Alias -Value _eza -Name ls
Set-Alias -Value _eza -Name ll
Set-Alias -Value _eza -Name la

# Touch, since now is not a default alias included in pwsh
function _touch {
    New-Item -ItemType "File" -Path ($args[0])
}
Set-Alias -Name touch -Value _touch

# which
function _which {
    Get-Command -Name ($args[0]) | Format-Table -Autosize -Property Version, Source
}
Set-Alias -Name which -Value _which

# `rm` function that accepts -r -f -rf like in unix
function _rm {
    Param(
        [switch]$r,
        [switch]$f,
        [switch]$rf,
        [Parameter(Mandatory=$true, Position=1)]
        [string[]]$target
    )
    $help_msg =
        "Usage:`t" +
        "rm [-rf] | [-r] | [-f] path"

    if ($PSBoundParameters.Count -gt 2) {
        Write-Error 'Error: Too many parameters.'
        echo $help_msg
        return
    }

    $flags = switch (@($PSBoundParameters.Keys)[0]) {
        'r'  { '-Recurse' }
        'f'  { '-Force' }
        'rf' { '-Recurse -Force' }
        default { '-Confirm' }
    }
    echo "Remove-Item $flags $target"
    Invoke-Expression "Remove-Item $flags $target"
}
Set-Alias -Name rm -Value _rm

# Search with Fuzzy finder -> Vim
function _vim_fzf {
    Get-ChildItem . -Recurse -Attributes !Directory | Invoke-Fzf | % { vim $_  }
}
Set-Alias -Name edit -Value _vim_fzf

# Jetbrains IDE (eg. pycharm)
function pycharm {
    param ([string]$File)
    $filename = ($File) ? $File : ($args[0]) ? $args[0] : '.'
    Start-Process `
        -FilePath 'C:\Program Files\JetBrains\PyCharm 2024.3.4\bin\pycharm64.exe' `
        -ArgumentList "nosplash", "dontReopenProjects", "'$filename'"
}

# Notepad++ simple alias to allow pass args to npp
Set-Alias -Name npp -Value "$env:HOMEPATH\scoop\shims\notepad++.exe"

#------------------------------------------------------------------------------
# Aliases to promote laziness XD
#------------------------------------------------------------------------------

# Alias to commonly used files to open with prefered editor like *nix
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

function _cd_projects {
    $path = "~/Documents/Projects"
    if ($args[0]) {
        $npath = $path + '/' + ($args[0])
        if (Test-Path -Path $npath) {
            $path = $npath
        }
    }
    Set-Location -Path $path
}
Set-Alias -Value _cd_projects -Name pro

function _cd_proj_by_name {
    $sub = ($args[0]) ? '/' + $args[0] : ''
    _cd_projects ($MyInvocation.InvocationName + $sub)
}
Set-Alias -Value _cd_proj_by_name -Name personal
Set-Alias -Value _cd_proj_by_name -Name work

###############################################################################
# Local stuff
###############################################################################
$PWSH_CONFIG_DIR = "~/.config/pwsh"
if (Test-Path -Path $PWSH_CONFIG_DIR -PathType Container) {
    . "$PWSH_CONF_DIR/local.ps1"
}

# vim: set ft=ps1 ts=4 sts=4 sw=4 et :
