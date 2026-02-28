# ---------------------------------------------------------
# Alias
# ---------------------------------------------------------
if status is-interactive

    alias vd 'vimdiff'

    alias dkcl 'docker container ls --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Status}"'
    alias dkil 'docker image ls --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.CreatedAt}}\t{{.CreatedSince}}"'

    alias typora 'open -a typora'

end
