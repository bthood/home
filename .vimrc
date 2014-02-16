" Set up Vundle (https://github.com/gmarik/Vundle.vim)
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Pathogen
Bundle 'tpope/vim-pathogen'
execute pathogen#infect()

" NERDTree - tree-like file navigator
Bundle 'scrooloose/nerdtree'
nmap <C-n> :NERDTreeToggle<Cr>

" CtrlP - fuzzy tag finder
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map='<c-p>'

" Syntastic - syntax checker
Bundle 'scrooloose/syntastic'

Helptags

" ----- MAIN VIM CONFIGURATION -----

" Turn filetype detection on
filetype plugin on
filetype indent on

" LaTeX plugin options
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

" Generate tags files for C/C++/Java
au BufWritePost *.c,*.cpp,*.h,*.java silent! !ctags -R &

" General options
set backspace=indent,eol,start
set showmatch
set noerrorbells

" Syntax options
syntax enable
syntax on
set background=dark

" Search preferences
set incsearch
set nohlsearch
set smartcase

" Indentation preferences
set autoindent
set smarttab
set expandtab
set tabstop=3
set softtabstop=3
set shiftwidth=3
set autoindent

" Turn on line numbering
set number

" My favorite keymappings
nmap wq :wq!<Cr>
nmap Wq :wq<Cr>
nmap qq :q!<Cr>
nmap gr gT
nmap fr <C-w><right>
nmap fe <C-w><left>
nmap fq <C-w><up>
nmap fa <C-w><down>
command Wq wq
command W w
command Q q!

" Eliminate any trailing whitespace on write
autocmd BufWritePre * :%s/\s\+$//e

" Put .swp files in ~/.vim/temp
set directory=~/.vim/temp
set backupdir=~/.vim/temp
