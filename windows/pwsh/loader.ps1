# vim: set ft=ps1 ts=4 sts=4 sw=4 et :

# -----------------------------------------------------------------------------
# Load other powershell configuration files
# -----------------------------------------------------------------------------

$_INC_DIRECTORIES = ('includes', 'optionals')

foreach ($dir in $_INC_DIRECTORIES) {
    $path = "$PWSH_CONFIG_DIR\$dir"
    if (!(Test-Path -Path $path -PathType Container)) {
        Write-Warning "Config path not found: $path"
        continue
    }

    Get-ChildItem -Path $path -Filter *.ps1 | ForEach-Object {
        try { . $_.FullName }
        catch { Write-Warning "Failed to load $($_.Name): $_" }
    }
}
