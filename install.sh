#!/bin/bash

PREFIX='>>> '
COLOR_RESET=$(tput sgr0 2> /dev/null)
COLOR_INFO=$(tput setaf 6 2> /dev/null)
COLOR_OK=$(tput setaf 2 2> /dev/null)
COLOR_WARN=$(tput setaf 3 2> /dev/null)
COLOR_ERR=$(tput setaf 1 2> /dev/null)
COLOR_CMD=$(tput setaf 5 2> /dev/null)
BANNER_FMT="$COLOR_CMD$PREFIX%s %s %s$COLOR_RESET"
BANNER_EOL='\n'
PWD=$(pwd)
ZSH_FILES="zlogin zlogout zpreztorc zshenv"
FILES="vim vimrc tmux.conf zsh-source zshrc zprezto nvimrc gitconfig irssi zlogin zlogout zpreztorc zshenv tmux git_template gitignore_global"
ESSENTIALS_APPS="vim curl git wget tree autojump autoconf automake mercurial tmux tmux-mem-cpu-load grep the_platinum_searcher "
LANGUAGES="python3 python rust iojs go lua"
SECONDARY_APPS="nginx saltstack docker docker-machine docker-swarm docker-compose zeromq"
GUI_APPS="chrome firefox iterm2 1password limechat rdio hipchat razer-synapse viscosity virtualbox"
GUI_APPS+="appcleaner transmit"
USRLOCAL="/usr/local/bin"

function banner {
	printf "$BANNER_FMT""$BANNER_EOL" "$COLOR_CMD$1" "$2" "$3"
}

function link {
	#rm -rf ${HOME}/.nvim
	#ln -s ${PWD}/vim ${HOME}/.nvim
	#for file in $FILES; do
#		banner $COLOR_INFO "started linking" "${HOME}/.${file}"
#		rm -rf $HOME/.${file}\
#		ln -s ${PWD}/${file} ${HOME}/.${file}
#	done
	ln -s "${PWD}/zprezto" "${HOME}/.zprezto"
	for file in $ZSH_FILES; do
		banner $COLOR_INFO "started linking" "${HOME}/.${file}"
		rm ${HOME}/.${file}
		ln -s ${PWD}/zprezto/runcoms/${file} ${HOME}/.${file}
	done
	ln -s "${PWD}/bin/git-commitmsg" "${USRLOCAL}/git-commitmsg"
	ln -s "${PWD}/prompt_austin_setup" "${HOME}/.zprezto/modules/prompt/functions"
}

function tmux {
	ln -s "${PWD}/tmux.conf" "${HOME}/.tmux.conf"
	ln -s "${PWD}/tmux" "${HOME}/.tmux"
}

function brew {
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	# install brew cask
	brew install caskroom/cask/brew-cask
	brew update
}

function tpm {
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

function essentials {
	brew install $ESSENTIAL_APPS
	brew install $LANGUAGES
}
function secondaryApps {
	brew install $SECONDARY_APPS
}

function gui {
	brew cask install $GUI_APPS
}

function nvim {
	ln -s vim/bundles/ausokai/colors/ausokai.vim /usr/local/share/nvim/runtime/colors
}

case $1 in
link)
	link
	;;
brew)
	brew
	;;
essential)
	essentials
	;;
secondary)
	secondaryApps
	;;
gui)
	gui
	;;
tmux)
	tmux
	;;
tpm)
	tpm
	;;
nvim)
	nvim
	;;
*)
	cat <<USAGE
$0 [command]
link		remove source files and symlink them to repo
brew		installing homebrew
essential   install essential apps to code
secondary   install secondary fun cli programs
gui			install all my gui apps
USAGE
	exit 64
	;;
esac
