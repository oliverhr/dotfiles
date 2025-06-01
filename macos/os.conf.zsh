# vim: set ft=zsh ts=4 sw=4 noet :

# Overrides
# alias openssl='/usr/local/opt/openssl@1.1/bin/openssl'


# PyEnv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

# Java
#export JAVA_HOME=$(/usr/libexec/java_home --version 17)
#export PATH="$JAVA_HOME/bin:$PATH"

# Scala
export PATH="$HOME/Library/ApplicationSupport/Coursier/bin:$PATH"

# iTerm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#RubyEnv
eval "$(rbenv init - zsh)"

# GCloud
#source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
#source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

