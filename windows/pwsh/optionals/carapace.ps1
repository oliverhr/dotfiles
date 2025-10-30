# vim: set ft=ps1 ts=4 sts=4 sw=4 et :

# -----------------------------------------------------------------------------
# Carapace-bin
# -----------------------------------------------------------------------------
$env:CARAPACE_BRIDGES = 'powershell,inshellisense'
Set-PSReadLineOption -Colors @{ "Selection" = "`e[7m" }
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
carapace _carapace | Out-String | Invoke-Expression

