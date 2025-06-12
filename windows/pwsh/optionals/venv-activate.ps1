# vim: set ft=ps1 ts=4 sts=4 sw=4 et :

# -----------------------------------------------------------------------------
# Helper to activate a python venv
# -----------------------------------------------------------------------------
function activate {
    param ([string]$Path = './.venv/')
    $_VENV_DIR = (Resolve-Path $Path)
    if (Test-Path -Path $_VENV_DIR -PathType Container) {
        & $_VENV_DIR\Scripts\activate.ps1

        Write-Host "`n Activated Virtual Environment " -ForegroundColor White -BackgroundColor DarkGreen -NoNewline
        which python
    }
}

