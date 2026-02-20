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

# Open Chrome based browser with a DNS Map
function chromap {
    param (
        [Parameter(Mandatory = $true)]
        [string]$domain,

        [Parameter(Mandatory = $false)]
        [string]$url,

        [Parameter(Mandatory = $false)]
        [string]$browser = "$env:HOMEPATH\scoop\apps\ungoogled-chromium\current\chrome.exe"
    )

    $host_rule = '--host-rules="MAP {0} 127.0.0.1"' -f $domain
    $args = @(
        $host_rule
         "--window-size=1440,880"
         "--incognito"
         "--auto-open-devtools-for-tabs"
         $url
    )

    Start-Process -FilePath $browser -ArgumentList $args
}

# vim: set ft=ps1 ts=4 sts=4 sw=4 et :
