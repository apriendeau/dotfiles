# aliases
alias v='vagrant'
alias vi='/usr/local/bin/nvim'
alias tree='tree -C -I node_modules'
alias dock='docker'

#node
alias node='node --harmony'
alias nodemon='nodemon --harmony'

alias rm="rm"
alias ls="ls -G"
alias ll="ls -Gla"
alias la="ls -Ga"

#git
alias gco='git checkout'
alias gst='git status'
alias gadd='git add'
alias gcom='git commit'
alias gpush='git push'
alias gpurge='git checkout master && git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
#chrome-cli
alias chrome='chrome-cli'

# elasticsearch
alias elasticsearch='elasticsearch --config=/usr/local/Cellar/elasticsearch/1.4.0/config/elasticsearch.yml'
alias elasticsearch_cmd='elasticsearch'
alias es='es -u localhost:9200'
alias es_cmd='es'

alias mongod='mongod --config /usr/local/etc/mongod.conf'

# cowsay
alias cowsay='cowsay -f ghostbusters'

alias updateNeovim='brew reinstall --HEAD neovim'

alias wtcommit='curl -s whatthecommit.com | grep "<p>" | sed s/\<p\>//g'
alias bitly_squash="git fetch bitly && git rebase -i bitly/master"
alias dm='docker-machine'


