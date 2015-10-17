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
ZSH_FILES="zlogin zlogout zpreztorc zshenv zshrc"
FILES="irssi"
ESSENTIALS_APPS="vim curl git wget tree autojump autoconf automake mercurial tmux tmux-mem-cpu-load grep the_platinum_searcher "
LANGUAGES="python3 python rust iojs go lua"
SECONDARY_APPS="nginx saltstack docker docker-machine docker-swarm docker-compose zeromq"
GUI_APPS="chrome firefox iterm2 1password limechat rdio hipchat razer-synapse viscosity virtualbox"
GUI_APPS+="appcleaner transmit"
USRLOCAL="/usr/local/bin"

function banner {
	printf "$BANNER_FMT""$BANNER_EOL" "$COLOR_CMD$1" "$2" "$3"
}
function banner_info {
	printf "$BANNER_FMT""$BANNER_EOL" "$COLOR_CMD$COLOR_INFO" "$1"
}

function link {
	if [ -z "${2// }" ]; then
		banner_info "${1} -> ${1}"
		rm ${HOME}/.${1}
		ln -s "${PWD}/${1}" "${HOME}/.${1}"
	else
		banner_info "${1} -> ${2}"
		rm ${HOME}/.${2}
		ln -s "${PWD}/${1}" "${HOME}/.${2}"
	fi
}

function link_git {
	link gitignore_global
	link gitconfig
	link git_template
	ln -s "${PWD}/bin/git-commitmsg" "${USRLOCAL}/git-commitmsg"

}

function link_nvim {
	link nvimrc
	link nvimrc vimrc
	link vim
	link vim nvim
}

function link_tmux {
	link tmux.conf
	link tmux
}

function link_zsh {
	link zprezto
	ln -s "${PWD}/prompt_austin_setup" "${HOME}/.zprezto/modules/prompt/functions"

	for file in $ZSH_FILES; do
		link zprezto/runcoms/${file} ${file}
	done
}
function link_test {
	banner_info "link test debugged"
}

function link_apples {
	banner_info "linked some apples"
}

function link_all {
	link_nvim
	link_zsh
	link_git
	link_tmux
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
link_*)
	$1
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
