if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=/Users/austin/.vim/bundle/neobundle.vim/
endif

" Required:
call plug#begin('~/.vim/plugged')

" My Bundles here:
Plug 'tpope/vim-fugitive'
Plug 'elzr/vim-json'
Plug 'scrooloose/nerdtree'
Plug 'walm/jshint.vim'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'juvenn/mustache.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/nginx.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bling/vim-airline'
Plug 'hlissner/vim-multiedit'
Plug 'scrooloose/nerdcommenter'
Plug 'fatih/vim-go'
Plug 'Raimondi/delimitMate'
Plug 'godlygeek/tabular'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'Chiel92/vim-autoformat'
Plug 'burnettk/vim-angular'
Plug 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
Plug 'markcornick/vim-terraform'
Plug 'apriendeau/vim-colorline'
Plug 'tmux-plugins/vim-tmux'
Plug 'saltstack/salt-vim'
Plug 'sjl/vitality.vim'
Plug 'mbbill/undotree'
Plug 'Yggdroot/indentLine'
Plug 'ap/vim-css-color'
Plug 'reedes/vim-colors-pencil'
Plug 'rust-lang/rust.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'cespare/vim-toml'

" Required:
call plug#end()
" Required:
filetype plugin indent on

let g:python3_host_prog = '/usr/local/bin/python3'

" Basic Settings
set clipboard=unnamed
set number
set relativenumber
set background=dark
set mouse=a
set tabstop=4
set shiftwidth=0
set relativenumber
set laststatus=2
set list
set listchars=tab:>-,eol:$ "Make tab characters and others visible
let g:airline_theme='colorline'
let g:airline_powerline_fonts = 0

syntax on
set backspace=indent,eol,start
color pencil

set splitright

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%100v.\+/

source $HOME/.nvim/vim_settings
source $HOME/.nvim/vim_commands
source $HOME/.nvim/vim_mappings
source $HOME/.nvim/vim_syntax

" Store temporary files in a central spot
"
set backup
set backupdir=~/.backups,~/.tmp,~/tmp,/var/tmp,/tmp " where to put backup
" files
set directory=~/.backups,~/.tmp,~/tmp,/var/tmp,/tmp " where to put swap  files
set backupskip=/tmp/*,/private/tmp/* "do not backup when editing files in these directories
set writebackup "create backup when saving a file,for when vim crashes trying to save a file
autocmd FocusLost * :wa " save on lost focus

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
