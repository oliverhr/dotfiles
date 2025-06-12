# vim: set ft=ps1 ts=4 sts=4 sw=4 et :

#------------------------------------------------------------------------------
# Local stuff
#------------------------------------------------------------------------------
<#
# _cd_proj_by_name is defined on includes "dir_project_alias.ps1"
# override projects directory path
$PROJECTS_DIRECTORY_PATH = "~/Projects"

Set-Alias -Value _cd_proj_by_name -Name work
function _cd_work_project_by_alias {
    $path = switch($MyInvocation.InvocationName) {
        api { 'client-a/backend' }
        app { 'client-c/bot' }
        bot { 'client-c/bot' }
        ui  { 'client-b/frontend' }
    }
    if ($args[0]) { $path += '/' + $args[0] }
    work $path
}
Set-Alias -Value _cd_work_project_by_alias -Name api
Set-Alias -Value _cd_work_project_by_alias -Name ui
Set-Alias -Value _cd_work_project_by_alias -Name app
Set-Alias -Value _cd_work_project_by_alias -Name bot
#>
