# vim: set ft=ps1 ts=4 sts=4 sw=4 et :

# -----------------------------------------------------------------------------
# Docker alias
# -----------------------------------------------------------------------------
Set-Alias -Value docker -Name dk

function _docker {
    switch($Myinvocation.InvocationName) {
        dkps { docker container ls --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Status}}" }
        dkpf { docker container ls --format "table {{.ID}}\t{{.Names}}\t{{.CreatedAt}}\t{{.State}}\t{{.Ports}}" }
        dkim { docker image ls }
        dkif { docker image ls --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.CreatedAt}}\t{{.CreatedSince}}" }
    }
}
Set-Alias -Value _docker -Name dkim
Set-Alias -Value _docker -Name dkif
Set-Alias -Value _docker -Name dkps
Set-Alias -Value _docker -Name dkpf

