###############################################################################
# Common Alias
###############################################################################

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
        Write-Host $help_msg
        return
    }

    $flags = switch (@($PSBoundParameters.Keys)[0]) {
        'r'  { '-Recurse' }
        'f'  { '-Force' }
        'rf' { '-Recurse -Force' }
        default { '-Confirm' }
    }
    Write-Host "Remove-Item $flags $target"
    Invoke-Expression "Remove-Item $flags $target"
}
Set-Alias -Name rm -Value _rm

# vim: set ft=ps1 ts=4 sts=4 sw=4 noet :