"""""""""""""
" Be iMproved
"""""""""""""
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

" Required:
call plug#begin('~/.vim/plugged')

"""""""""
" Plugins
"""""""""
Plug 'tpope/vim-fugitive'
Plug 'elzr/vim-json'
Plug 'scrooloose/nerdtree'
Plug 'walm/jshint.vim'
Plug 'pangloss/vim-javascript'
Plug 'juvenn/mustache.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/nginx.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bling/vim-airline'
Plug 'hlissner/vim-multiedit'
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'godlygeek/tabular'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'tomtom/tcomment_vim'
Plug 'Chiel92/vim-autoformat'
Plug 'burnettk/vim-angular'
Plug 'apriendeau/vim-colorline'
Plug 'tmux-plugins/vim-tmux'
Plug 'sjl/vitality.vim'
Plug 'mbbill/undotree'
Plug 'Yggdroot/indentLine'
Plug 'ap/vim-css-color'
Plug 'reedes/vim-colors-pencil'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'cespare/vim-toml'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-scripts/greplace.vim'
Plug 'ingydotnet/yaml-vim'

"""""""""""
" languages
"""""""""""
Plug 'markcornick/vim-terraform'
Plug 'moll/vim-node'
Plug 'maksimr/vim-jsbeautify'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'saltstack/salt-vim'
Plug 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
Plug 'cakebaker/scss-syntax.vim'
Plug 'othree/html5.vim'

" Required:
call plug#end()

" Required:
filetype plugin indent on
let g:autoclose_on = 0
let g:python3_host_prog = '/usr/local/bin/python3'

""""""""""""""""
" Basic Settings
""""""""""""""""
set clipboard=unnamed
set number
set relativenumber
set background=dark
set mouse=a
set tabstop=4
set shiftwidth=0
set relativenumber
set laststatus=2
set backspace=indent,eol,start

""""""""""""
" DEBUG ONLY
""""""""""""
"set list
"set listchars=tab:>-,eol:$ "Make tab characters and others visible

"""""""""
" Theming
"""""""""
let g:airline_theme='colorline'
let g:airline_powerline_fonts = 0
set colorcolumn=80
set textwidth=80
syntax on
color pencil

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
" save on lost focus
autocmd FocusLost * :wa
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

set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

source $HOME/.nvim/vim_settings
source $HOME/.nvim/vim_commands
source $HOME/.nvim/vim_mappings
source $HOME/.nvim/vim_syntax
source $HOME/.nvim/vim_html
source $HOME/.nvim/vim_golang
