source /Users/austin/.antigen/antigen.zsh
ZSH=/Users/austin/.oh-my-zsh
ZSH_THEME="norm-custom"
source $HOME/.zsh-source/aliases
source $HOME/.zsh-source/vars
source $HOME/.zsh-source/keybinding
PROG=utopia source /usr/local/share/zsh/site-functions/utopia_autocomplete.zsh
#Autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

#NVM
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM

ssh-add $HOME/.ssh/dev-staging-00.pem &> /dev/null
ssh-add $HOME/.vagrant.d/insecure_private_key &> /dev/null
ssh-add $HOME/.ssh/20130919-vpc.pem &> /dev/null
ssh-add $HOME/.ssh/dev-staging-00.pem &> /dev/null

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
  # Ruby
  ruby
  gem

  # Node
  node
  npm
  nvm

  # Go
  golang

  # System
  osx
  brew
  vagrant
  docker
  cp
  tmux
  git
  git-extras

  # Extras
  atom
  web-search
  zsh-users/zsh-syntax-highlighting

  command-not-found


EOBUNDLES

antigen apply

source $ZSH/oh-my-zsh.sh
