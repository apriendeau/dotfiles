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
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'elzr/vim-json'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'walm/jshint.vim'
NeoBundle 'moll/vim-node'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'juvenn/mustache.vim'
NeoBundle 'wincent/Command-T'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'vim-scripts/nginx.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-scripts/candy.vim'
NeoBundle 'ciaranm/inkpot'
NeoBundle 'vim-scripts/Align'
NeoBundle 'hlissner/vim-multiedit'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'fatih/vim-go'

" You can specify revision/branch/tag.

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

set number
set background=light
set mouse=a
set tabstop=2
set expandtab
syntax on
color candy
" set relativenumber
set backspace=indent,eol,start
set noerrorbells visualbell t_vb=
source $HOME/.vim/vim_settings
source $HOME/.vim/vim_commands
source $HOME/.vim/vim_mappings

" set list listchars=tab:»·,trail:· " show extra space characters

set rtp+=$GOROOT/misc/vim

" Store temporary files in a central spot
" set backup
" set backupdir=~/.backups,~/.tmp,~/tmp,/var/tmp,/tmp " where to put backup
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
