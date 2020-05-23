" file:   ~/.config/nvim/init.vim
" author: vanir

call plug#begin(expand('~/.config/nvim/plugged'))
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim',{'as':'dracula'}
call plug#end()

syntax on
"colorscheme nord
colorscheme dracula

set number
set relativenumber

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

