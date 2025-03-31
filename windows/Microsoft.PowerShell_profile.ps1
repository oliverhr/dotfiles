# vim: set ft=ps1 ts=4 sts=4 sw=4 et :

#------------------------------------------------------------------------------
# https://poshcode.gitbook.io/powershell-practice-and-style/style-guide/code-layout-and-formatting
#------------------------------------------------------------------------------

###############################################################################
# Custom Powershell profile
###############################################################################

$omptheme = 'robbyrussell'
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\$omptheme.omp.json" | Invoke-Expression

#------------------------------------------------------------------------------
# Control how the history is being managed
#------------------------------------------------------------------------------
$PSReadLineHistoryHandler = {
    Param([string]$line)
    $patterns = @(
        '^ls[\s]*'
        '^cp[\s]'
        '^mv\s'
        '^mkdir\s'
        '^cd[\s]*'
        '^rm\s'
        '^touch\s'
        'exit'
        '^vim', '^gvim', '^pycharm', '^code', '^npp'
        'clear', 'celar', 'claer'
        '^git\s', '^g[sa][ta]$', '^gsw', '^g[acfldp]$'
        '^:'
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
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}

#------------------------------------------------------------------------------
# Git module
# https://github.com/gluons/powershell-git-aliases
Import-Module git-aliases -DisableNameChecking

#------------------------------------------------------------------------------
# Docker completions
# https://github.com/matt9ucci/DockerCompletion
Import-Module DockerCompletion

#------------------------------------------------------------------------------
# Fuzzyfinder fzf
# https://github.com/junegunn/fzf
#------------------------------------------------------------------------------
Set-PsFzfOption `
    -PSReadlineChordProvider 'Ctrl+t' <# keyboard shortcut to start a search #>`
    -PSReadlineChordReverseHistory 'Ctrl+r' <# shortcut to search on history #>`
    -EnableAliasFuzzyEdit <# Enable command: fe #>
    #-EnableAliasFuzzySetLocation <# diasbled since got installed fd from scoop #>

#------------------------------------------------------------------------------
# Get-ChildItemColor
# https://github.com/joonro/Get-ChildItemColor
#------------------------------------------------------------------------------
Import-Module Get-ChildItemColor
Set-Alias ll Get-ChildItemColor -option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -option AllScope <# -HideHeader #>

###############################################################################
# Custom Stuff
###############################################################################
# Set alias for some used unix commands
# Alias for start to open like macos
Set-Alias -Name open -Value Start-Process

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

function _lw {
    get-ChildItem ($args[0]) | Format-Wide -Autosize
}
Set-Alias -Name lw -Value _lw

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
Set-Alias -Name npp -Value "C:\Program Files\Notepad++\notepad++.exe"

# Search with Fuzzy finder -> Vim
function _vim_fzf {
    Get-ChildItem . -Recurse -Attributes !Directory | Invoke-Fzf | % { vim $_  }
}
Set-Alias -Name edit -Value _vim_fzf

#------------------------------------------------------------------------------
# Aliases to promote laziness XD
#------------------------------------------------------------------------------
function _source_profile {
    . $PROFILE
}
Set-Alias -Name src -Value _source_profile

# Alias to commonly used files to open with prefered editor like *nix
$env:EDITOR = 'vim'
function _open_with_editor {
    $target = switch ($MyInvocation.InvocationName) {
        confpsh { $PROFILE }
        confvim { "~/vimfiles/vimrc" }
        confgit { "~/.gitconfig" }
        checkhistory { (Get-PSReadLineOption).HistorySavePath }
    }
    $exp = "$($env:EDITOR) ""$($target)"""
    Invoke-Expression $exp
}
Set-Alias -Value _open_with_editor -Name confpwsh
Set-Alias -value _open_with_editor -Name confvim
Set-Alias -value _open_with_editor -Name confgit
Set-Alias -value _open_with_editor -Name checkhistory

###############################################################################
# Local stuff
###############################################################################
function _cd_projects_root {
    $path = '~/Projects/'
    if ($args[0]) {
        $npath = $path + ($args[0])
        if (Test-Path -Path $npath) {
            $path = $npath
        }
    }
    Set-Location -Path $path
}
Set-Alias -Value _cd_projects_root -Name projects

function _cd_project_type_by_name {
    $sub = ($args[0]) ? '/' + $args[0] : ''
    _cd_projects_root ($MyInvocation.InvocationName + $sub)
}
Set-Alias -Value _cd_project_type_by_name -Name personal
Set-Alias -Value _cd_project_type_by_name -Name work

function _cd_work_project_by_alias {
    # $Myinvocation.myCommand.name return the function name
    # $Myinvocation.InvocationName return the caller/alias name
    $path = switch ($MyInvocation.InvocationName) {
        'back'   { 'directory-name-for-backend' }
        'front'  { 'directory-name-for-frontend' }
        'lambda' { 'directory-name-for-microservices' }
    }
    if ($args[0]) { $path += '/' + $args[0] }
    # Invocation of "_cd_project_type_by_name" using alias "work"
    work $path
}
Set-Alias -Value _cd_work_project_by_alias -Name api
Set-Alias -Value _cd_work_project_by_alias -Name ui
Set-Alias -Value _cd_work_project_by_alias -Name svc

########-####-####-####-############ PowerToys CommandNotFound module
Import-Module -Name Microsoft.WinGet.CommandNotFound
########-####-####-####-############
