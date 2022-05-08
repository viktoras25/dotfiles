set nocompatible              " be iMproved, required

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set exrc
set secure

set whichwrap+=<,>,h,l,[,]

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
colorscheme monokai

Plugin 'tpope/vim-sensible'
