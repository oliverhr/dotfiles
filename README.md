# My custom configs & Dot Files

### Dot files

* Vim (mac | windows | MSys | Vim[7|8|9])
* Zsh | Bash | Powershell
* Aliases [zsh |bash]
* Git global [config | ignore | alias]
* Tmux with plugins

### Zsh theme Geekster - a zsh theme

A minimal theme that shows git information for current dir.

### iTerm 2 confs and theme

- Chido Dark is a Dark Blue color scheme for iterm 2

- Darkerized is a solarized theme clone with a darkest background and black color light because some problems
on non ips displays.


## Manually installed vim stuff

- Coloschemes
- Airline Themes

Example:
```
$ns_dir=~/.vim/pack/theming
mkdir -p $ns_dir/{start,opt}
git clone https://github.com/vim-airline/vim-airline-themes.git $ns_dir/start/airline-themes
git clone https://github.com/ryanoasis/vim-devicons $ns_dir/start/devicons
git clone https://github.com/nordtheme/vim.git $ns_dir/opt/nord
```

## Notes

On windows `vim` included with `git-bash` support placing the configuration on `~/.config/git/` it work well except with `git difftool ...`.

## Additional Tools to Install

This [tools](tools.md) are pretty useful some a must. (_not all of them are available on (RH)EL or are too outdated_)

### Arch
```
_ pacman -S base-devel \
  curl vim tmux openssh git \
  direnv bat fzf zoxide ripgrep \
  git-delta lazygit nvim \
  fd sd xh procs zellij \
  the_silver_searcher go-task
```

### Debian
```
_ apt install -y build-essential \
  curl vim tmux openssh-client git \
  direnv bat fzf zoxide ripgrep \
  git-delta lazygit nvim \
  sd xh procs silversearcher-ag \
```

Not availble on debian repositories:
- fd
- zellij
- task


### Open SUSE [Tumbleweed]
```
_ zypper in --type pattern devel_basis
_ zypper in \
  curl vim tmux openssh git \
  direnv bat fzf zoxide ripgrep \
  git-delta lazygit nvim \
  fd sd xh procs zellij \
```

Not available for opensuse package manager:

- the_silver_searcher
- go-task

