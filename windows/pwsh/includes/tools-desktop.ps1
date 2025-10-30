#------------------------------------------------------------------------------
# Alias and functions for Desktop Software
#------------------------------------------------------------------------------

# Jetbrains IDE (eg. pycharm)
function pycharm {
    param ([string]$File)
    $filename = ($File) ? $File : ($args[0]) ? $args[0] : '.'
    Start-Process `
        -FilePath "$env:HOMEPATH\scoop\apps\pycharm-professional\current\IDE\bin\pycharm64.exe" `
        -ArgumentList "nosplash", "dontReopenProjects", "'$filename'"
}

# Notepad++ simple alias to allow pass args to npp
Set-Alias -Name npp -Value "$env:HOMEPATH\scoop\shims\notepad++.exe"

# Winmerge
Set-Alias -Name winmergeu -Value "$env:HOMEPATH\scoop\shims\winmergeu.exe"
Set-Alias -Name winmerge -Value winmergeu
Set-Alias -Name wm -Value winmergeu

# vim: set ft=ps1 ts=4 sts=4 sw=4 et :
