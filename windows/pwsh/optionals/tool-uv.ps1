# vim: set ft=ps1 ts=4 sts=4 sw=4 et :

# -----------------------------------------------------------------------------
# UV
# -----------------------------------------------------------------------------

$env:UV_NATIVE_TLS=$true
(& uv generate-shell-completion powershell) | Out-String | Invoke-Expression

