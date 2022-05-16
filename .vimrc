set nocompatible

filetype plugin indent on

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set exrc
set secure
set number
set ruler
set whichwrap+=<,>,h,l,[,]
set nowrap

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tomasiser/vim-code-dark'
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
colorscheme codedark
let g:airline_theme = 'codedark'
