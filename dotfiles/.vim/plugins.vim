set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let vundle manage itself.
Plugin 'gmarik/Vundle.vim'

" colorschemes
Plugin 'altercation/vim-colors-solarized'

" utilities
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'gregsexton/MatchTag'
Plugin 'scrooloose/nerdTree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'powerline/fonts'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

" syntax
Plugin 'hail2u/vim-css3-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'StanAngeloff/php.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'PProvost/vim-ps1.git'
Plugin 'fatih/vim-go'
Plugin 'saltstack/salt-vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'lepture/vim-jinja'

" required, plugin available after.
call vundle#end()
filetype plugin indent on
