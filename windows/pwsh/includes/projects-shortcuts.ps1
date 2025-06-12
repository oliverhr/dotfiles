#------------------------------------------------------------------------------
# Aliases for frequent directories
#------------------------------------------------------------------------------

$PROJECTS_DIRECTORY_PATH = "~/Documents/Projects"

function _cd_projects {
    $path = $PROJECTS_DIRECTORY_PATH
    if ($args[0]) {
        $npath = $path + '/' + ($args[0])
        if (Test-Path -Path $npath) {
            $path = $npath
        }
    }
    Set-Location -Path $path
}
Set-Alias -Value _cd_projects -Name pro

function _cd_proj_by_name {
    $sub = ($args[0]) ? '/' + $args[0] : ''
    _cd_projects ($MyInvocation.InvocationName + $sub)
}
Set-Alias -Value _cd_proj_by_name -Name personal

# vim: set ft=ps1 ts=4 sts=4 sw=4 et :