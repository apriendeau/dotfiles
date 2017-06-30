"""""""""""""
" Be iMproved
"""""""""""""
if has('vim_starting')
  set nocompatible " Be iMproved
endif

" Install vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'

Plug 'fatih/vim-go'
Plug 'tell-k/vim-autopep8'
Plug 'nvie/vim-flake8'

Plug 'vim-scripts/nginx.vim'
Plug 'tpope/vim-markdown'
Plug 'ingydotnet/yaml-vim'

Plug 'Shougo/unite.vim'
Plug 'bling/vim-airline'
Plug 'elzr/vim-json'

Plug 'apriendeau/pencil'
Plug 'apriendeau/vim-colorline'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/neocomplete.vim'

" Required:
call plug#end()

" Required:
filetype plugin indent on

""""""""""""""""
" Basic Settings
""""""""""""""""
set background=dark
set clipboard=unnamed
set mouse=a
set tabstop=4
set shiftwidth=0
set laststatus=2
set backspace=indent,eol,start
let g:autoclose_on = 0

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

""""""""""
" Leader
""""""""""
let mapleader="\\"

set guicursor+=i:blinkwait10

""""""""""""
" python
""""""""""""
au FileType python set tabstop=4
  \ | set softtabstop=4
  \ | set shiftwidth=4
  \ | set textwidth=119
  \ | set expandtab
  \ | set autoindent
  \ | set fileformat=unix

let g:autopep8_max_line_length=119
let g:syntastic_python_checkers=['flake8']

"""""""""""""
" markdown
"""""""""""""
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'go']
" Turn off Matching paren highlighting because its annoying.
let loaded_matchparen = 0

""""""""""""""""""
" Vertical splits
""""""""""""""""""
noremap <Leader>v :vsp<CR>
noremap <Leader>h :sp<CR>

""""""""""""
" Split Nav
""""""""""""
nmap <C-k> :wincmd k<CR>
nmap <C-j> :wincmd j<CR>
nmap <C-h> :wincmd h<CR>
nmap <C-l> :wincmd l<CR>
nnoremap <C-S-Right> <esc>$
nnoremap <C-S-Left> <esc>^

nnoremap <Leader>/ <C-_>

map <Leader><cc> <C-_><C-_>

"""""
"tabs
"""""
map <C-1> 1gt
map <C-2> 2gt
map <C-3> 3gt
map <C-4> 4gt
map <C-5> 5gt
map <C-6> 6gt
map <C-7> 7gt
map <C-8> 8gt
map <C-9> 9gt

map <C-0> :tablast<CR>
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>

""""""""""""""""
" External files
""""""""""""""""
for f in split(glob('~/.vim/vim_*'), '\n')
  execute 'source' f
endfor

