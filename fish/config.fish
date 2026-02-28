fish_add_path $HOME/.local/bin

set -g fish_greeting

# Commands to run in interactive sessions can go here
if status is-interactive
    direnv hook fish | source
    zoxide init fish | source

    # Set up fzf key bindings -https://github.com/PatrickF1/fzf.fish
    fzf_configure_bindings --history=\e\cr --variables=\e\cv
    fzf --fish | source

    cd $HOME/Documents
end

