source $HOME/.zsh-source/aliases
source $HOME/.zsh-source/keybinding
source $HOME/.zsh-source/vars
source $HOME/.zsh-source/secrets
# Bunch
#if which bunch > /dev/null; then eval "$(bunch shim -)"; fi
export PATH=${PATH}:"/Users/austin/bin/FDK/Tools/osx"

PROG=utopia source /usr/local/share/zsh/site-functions/utopia_autocomplete.zsh
#Autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

export NVM_DIR="/Users/austin/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
unset DOCKER_TLS_VERIFY
unset DOCKER_CERT_PATH

# The next line enables shell command completion for gcloud.
source '/Users/austin/google-cloud-sdk/completion.zsh.inc'

# The next line updates PATH for the Google Cloud SDK.
source '/Users/austin/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/austin/google-cloud-sdk/completion.zsh.inc'
