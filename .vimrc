" https://github.com/tpope/vim-pathogen
call plug#begin('~/.vim/plugged')
Plug 'KeitaNakamura/neodark.vim'
call plug#end()

set incsearch
set hlsearch
"set number relativenumber

syntax on
filetype plugin indent on

syntax enable
colorscheme neodark
