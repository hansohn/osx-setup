set nocompatible
filetype off
filetype plugin indent on

" ----- Vundle -----
source ~/.vim/bundle.vim

" ----- Text formatting -----
set shiftwidth=2                            " use two characters for tabs.
set softtabstop=2                           " mindblowing.
set tabstop=2                               " skullcracking.
set expandtab                               " expand tabs to spaces.

" ----- UI settings -----
set showmode                                " show the mode we're currently in.
set showcmd                                 " always display commands.
set showmatch                               " highlight matching brackets/showbraces.
set cursorline                              " visualize current line.
set colorcolumn=80                          " mark the 80 char column.
set noerrorbells                            " disable error bells.
set visualbell                              " disable error bells.
set t_vb=                                   " disable error bells.
set laststatus=2                            " show the status line
set statusline=%F[%L][%{&ff}][%p%%][%l,%v]  " configure the status line
set number                                  " show current line number
set ruler                                   " show the ruler
set paste                                   " don't suck at pasting
set backspace=2                             " allow backspace in insert mode

" ----- Syntax and Color -----
source ~/.vim/dosbatch.vim

syntax on
set background=dark
colorscheme solarized
