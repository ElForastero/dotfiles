set mouse=a
set encoding=utf8
set number
set noswapfile
set scrolloff=1
set cursorline

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'projekt0n/github-nvim-theme'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

let g:airline_theme='deus'

call plug#end()

set hidden
set nobackup
set nowritebackup

colorscheme github_dark

" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" #nnoremap <C-f> :NERDTreeFind<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <leader>fg :Telescope live_grep<cr>
nnoremap <leader>fb :Telescope buffers<cr>
nnoremap <leader>fh :Telescope help_tags<cr>
