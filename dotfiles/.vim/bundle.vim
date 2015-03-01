set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Let Vundle manage itself.
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'mattn/emmet-vim'
Plugin 'gregsexton/MatchTag'
Plugin 'msanders/snipmate.vim'
Plugin 'scrooloose/syntastic'

" Syntax
Plugin 'hail2u/vim-css3-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'StanAngeloff/php.vim'
Plugin 'vim-ruby/vim-ruby'

" Color schemes
Plugin 'altercation/vim-colors-solarized'

" Required, plugin available after.
call vundle#end()
filetype plugin indent on
