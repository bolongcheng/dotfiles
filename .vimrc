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
"Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'wincent/command-t'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
   
syntax on
set number
set textwidth=100
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

" Enbale doscstring preview in folded mode
let g:SimpylFold_docstring_preview=1
let g:airline_powerline_fonts = 1 
"let g:Powerline_symbols = 'fancy'

au BufNewFile,BufRead *.py  set tabstop=4 
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

" Remap vsplit navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Remap ESC to jk
inoremap jk <Esc>
cnoremap jk <C-c>

" Use zenburn color scheme
if has('gui_running')
      set background=dark
        colorscheme solarized
    else
          colorscheme zenburn
    endif

"Map Ctrl-n to toggle NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" When you write a file, make sure no lines end in whitespace
au FileType cpp autocmd BufWritePre * :%s/\s\+$//e
au FileType java autocmd BufWritePre * :%s/\s\+$//e
au FileType scala autocmd BufWritePre * :%s/\s\+$//e
au FileType python autocmd BufWritePre * :%s/\s\+$//e

" open file where it was last edited
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
