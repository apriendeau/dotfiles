if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=/Users/austin/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/austin/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'elzr/vim-json'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'walm/jshint.vim'
NeoBundle 'moll/vim-node'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'juvenn/mustache.vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'vim-scripts/nginx.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'bling/vim-airline'
NeoBundle 'hlissner/vim-multiedit'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'fatih/vim-go'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'vim-scripts/Auto-Pairs'
NeoBundle 'godlygeek/tabular'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'burnettk/vim-angular'
NeoBundle 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
NeoBundle 'apriendeau/vim-colorline'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on


" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

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
let g:airline_theme='colorline'
let g:airline_powerline_fonts = 0
syntax on

set backspace=indent,eol,start
color ausokai

set splitright

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%100v.\+/

source $HOME/.vim/vim_files
source $HOME/.vim/vim_settings
source $HOME/.vim/vim_commands
source $HOME/.vim/vim_mappings

" Store temporary files in a central spot
"
set backup
set backupdir=~/.backups,~/.tmp,~/tmp,/var/tmp,/tmp " where to put backup
" files
set directory=~/.backups,~/.tmp,~/tmp,/var/tmp,/tmp " where to put swap  files
set backupskip=/tmp/*,/private/tmp/* "do not backup when editing files in these directories
set writebackup "create a backup when saving a file, useful for when vim crashes trying to save a file
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

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
