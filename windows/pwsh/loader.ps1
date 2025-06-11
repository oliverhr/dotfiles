# vim: set ft=ps1 ts=4 sts=4 sw=4 et :

# -----------------------------------------------------------------------------
# Load other powershell configuration files
# -----------------------------------------------------------------------------
$INC_DIR = "$HOME/.config/pwsh/includes"
$items = Get-ChildItem -Name -Path $INC_DIR/*.ps1
foreach ($item in $items) {
    . $INC_DIR/$item
}

