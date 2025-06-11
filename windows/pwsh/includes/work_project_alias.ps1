# vim: set ft=ps1 ts=4 sts=4 sw=4 et :

#------------------------------------------------------------------------------
# Local stuff
#------------------------------------------------------------------------------

function _cd_projects {
    $path = '~/Projects'
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
Set-Alias -Value _cd_proj_by_name -Name charter

#------------------------------------------------------------------------------

function _cd_work_project_by_alias {
    $path = switch($MyInvocation.InvocationName) {
        api   { 'code/aps-portal-api' }
        ui  { 'code/aps-portal-ui' }
        portal { 'code/portal' }
        rapnor { 'code/rapnor' }
        bot    { 'code/webexbot' }
        spikes { 'spikes' }
    }
    if ($args[0]) { $path += '/' + $args[0] }
    charter $path
}
Set-Alias -Value _cd_work_project_by_alias -Name api
Set-Alias -Value _cd_work_project_by_alias -Name ui
Set-Alias -Value _cd_work_project_by_alias -Name portal
Set-Alias -Value _cd_work_project_by_alias -Name rapnor
Set-Alias -Value _cd_work_project_by_alias -Name bot
Set-Alias -Value _cd_work_project_by_alias -Name spikes

