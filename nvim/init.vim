"""""""""""""
" Be iMproved
"""""""""""""
if has('vim_starting')
	set nocompatible " Be iMproved
endif

" Required:
call plug#begin('~/.vim/plugged')

"""""""
" Tools
"""""""
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'juvenn/mustache.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'
Plug 'hlissner/vim-multiedit'
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'Chiel92/vim-autoformat'
Plug 'tmux-plugins/vim-tmux'
Plug 'sjl/vitality.vim'
Plug 'mbbill/undotree'
Plug 'Yggdroot/indentLine'
Plug 'cespare/vim-toml'
Plug 'editorconfig/editorconfig-vim'
Plug 'Shougo/unite.vim'
Plug 'mhinz/vim-grepper'
Plug 'vim-scripts/SearchComplete'

"""""""""
" theming
"""""""""
Plug 'nathanaelkane/vim-indent-guides'
Plug 'guns/xterm-color-table.vim'
Plug 'apriendeau/pencil'
Plug 'apriendeau/vim-colorline'

""""""""
" golang
""""""""
Plug 'fatih/vim-go'

""""""
" rust
""""""
Plug 'rust-lang/rust.vim'

""""""""""""
" javascript
""""""""""""
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'maksimr/vim-jsbeautify'
Plug 'moll/vim-node'

""""""
" HTML
""""""
Plug 'burnettk/vim-angular'
Plug 'othree/html5.vim'

"""""
" CSS
"""""
Plug 'cakebaker/scss-syntax.vim'

"""""""""""""
" MISC Syntax
"""""""""""""
Plug 'nvie/vim-flake8'
Plug 'keith/swift.vim'
Plug 'markcornick/vim-terraform'
Plug 'saltstack/salt-vim'
Plug 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
Plug 'ingydotnet/yaml-vim'
Plug 'vim-scripts/nginx.vim'

" Required:
call plug#end()

" Required:
filetype plugin indent on
let g:python3_host_prog = '/usr/local/bin/python3'

""""""""
" Neovim
""""""""
if has('nvim')
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

""""""""""""""""
" Basic Settings
""""""""""""""""
set background=dark
set clipboard=unnamed
set mouse=a
set tabstop=4
set noexpandtab
set shiftwidth=0
set laststatus=2
set backspace=indent,eol,start
let g:autoclose_on = 0

"""""""""""""""
" DEBUGGING VIM
"""""""""""""""
"set list
"set listchars=tab:>-,eol:$ "Make tab characters and others visible

""""""""""""""""
" Theme Settings
""""""""""""""""
let g:airline_theme='colorline'
let g:airline_powerline_fonts = 1
set colorcolumn=120
syntax on
color pencil
set number
set relativenumber
set splitright

"""""""""""""""""
" Temporary files
"""""""""""""""""
set backup
set backupdir=~/.backups,~/.tmp,~/tmp,/var/tmp,/tmp " where to put backup
" where to put swap files
set directory=~/.backups,~/.tmp,~/tmp,/var/tmp,/tmp
"do not backup when editing files in these directories
set backupskip=/tmp/*,/private/tmp/*
"create backup when saving a file,for when vim crashes trying to save a file
set writebackup
" autocmd FocusLost * :wa

""""""""""""
" WhiteSpace
""""""""""""
function! s:StripWhiteSpaces()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction

autocmd BufWritePre * StripWhiteSpace
command! -range=% StripWhiteSpaces :silent call <SID>StripWhiteSpaces()

" Set link for vim-go
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

""""""""""""""""
" External files
""""""""""""""""

source $HOME/.config/nvim/vim_settings
source $HOME/.config/nvim/vim_commands
source $HOME/.config/nvim/vim_mappings
source $HOME/.config/nvim/vim_syntax
source $HOME/.config/nvim/vim_html
source $HOME/.config/nvim/vim_golang
source $HOME/.config/nvim/vim_python
