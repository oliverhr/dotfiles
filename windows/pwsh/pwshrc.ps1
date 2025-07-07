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
$env:XDG_CONFIG_HOME="$env:USERPROFILE/.config"
$env:XDG_STATE_HOME="$env:LOCALAPPDATA"
$env:XDG_CACHE_HOME="$env:LOCALAPPDATA/Temp"
# Next line affects commands like `uv tools install / uv tools dir`
# $env:XDG_DATA_HOME="$env:LOCALAPPDATA"

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
        '^[gn]?vi[m]?', '^pycharm', '^code', '^npp'
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

###############################################################################
# Local stuff
###############################################################################
Set-Variable PWSH_CONFIG_DIR -Option ReadOnly -Value "~\.config\pwsh"
if (Test-Path -Path $PWSH_CONFIG_DIR -PathType Container) {
    $files = 'alias', 'loader', 'local'
    foreach ($file in $files) {
        $path = "$PWSH_CONFIG_DIR\$file.ps1"
        if (!(Test-Path -Path $path -PathType Leaf)) {
            Write-Warning "Configuration file not found: $path"
            continue
        }
        . $path
    }
}

# -----------------------------------------------------------------------------
# Local Path last to be first ;)
# -----------------------------------------------------------------------------
$env:PATH = "$env:USERPROFILE/.local/bin;$env:PATH"

# vim: set ft=ps1 ts=4 sts=4 sw=4 et :
