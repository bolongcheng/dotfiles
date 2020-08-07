set nocompatible              " be improved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
    
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-airline/vim-airline'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'wincent/command-t'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set textwidth=119
set hls is
set lbr 
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set cindent
set encoding=utf-8
set t_Co=256
set cursorline
set laststatus=2
" Enable folding
set foldmethod=indent
set foldlevel=99
set number

" Enbale doscstring preview in folded mode
let g:SimpylFold_docstring_preview=1
let g:airline_powerline_fonts = 1 
" Setting python checker for syntastic
let g:syntastic_python_checkers = ['flake8']
au BufNewFile,BufRead *.py  set tabstop=4 
    \ softtabstop=2
    \ shiftwidth=2
    " \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

au BufRead,BufNewFile *.py let python_highlight_all=1 

au BufNewFile,BufRead *.java setf java
au BufNewFile,BufRead *.html setf html
au BufNewFile,BufRead *.py setf python
au BufNewFile,BufRead BUILD setf python

au FileType java set tw=119
au FileType html set tw=119
au FileType python set tw=119

" When you write a file, make sure no lines end in whitespace
au FileType java autocmd BufWritePre * :%s/\s\+$//e
au FileType python autocmd BufWritePre * :%s/\s\+$//e
au FileType javascript autocmd BufWritePre * :%s/\s\+$//e

" Remap vsplit navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Remap jk to esc
inoremap jk <Esc>
cnoremap jk <C-c>

" Remap block commenting
vnoremap <silent> # :s#^#\##<cr>:noh<cr>
vnoremap <silent> -# :s#^\###<cr>:noh<cr>
 
" Swap ; and : outside of insert mode
nnoremap ; :
vnoremap ; :

" Use zenburn color scheme
if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme zenburn
endif

"Map Ctrl-n to toggle NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" Open file where it was last edited
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

set tags=tags;/                                              
