source $HOME/.zsh-source/aliases
source $HOME/.zsh-source/keybinding
source $HOME/.zsh-source/vars
if which bunch > /dev/null; then eval "$(bunch shim -)"; fi

PROG=utopia source /usr/local/share/zsh/site-functions/utopia_autocomplete.zsh
#Autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


export HOMEBREW_CASK_OPTS="--appdir=/Applications"
unset DOCKER_TLS_VERIFY
unset DOCKER_CERT_PATH
