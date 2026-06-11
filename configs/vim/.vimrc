set runtimepath+=~/.config/vim
set termguicolors
colorscheme gruvbox

set nocompatible
filetype plugin on
filetype indent on
syntax on

set nu
set rnu
set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set scrolloff=12
set wrap
set incsearch
set smartcase
set showcmd
set hlsearch
set history=1000
set cursorline

let mapleader = " "
nnoremap <silent> <C-h> :noh<cr>

noremap <c-\> :vsplit<cr>
noremap <c-up> <c-w>5-
noremap <c-down> <c-w>5+
noremap <c-left> <c-w>10<
noremap <c-right> <c-w>10>
