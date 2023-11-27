set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let vundle manage itself.
Plugin 'gmarik/Vundle.vim'

" colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'dracula/vim'

" utilities
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'ekalinin/Dockerfile.vim'
" Plugin 'garbas/vim-snipmate'
Plugin 'gregsexton/MatchTag'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'nvie/vim-flake8'
Plugin 'powerline/fonts'
Plugin 'scrooloose/nerdTree'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline-themes'

" syntax
Plugin 'PProvost/vim-ps1.git'
Plugin 'StanAngeloff/php.vim'
Plugin 'b4b4r07/vim-hcl'
Plugin 'derekwyatt/vim-scala'
Plugin 'elubow/cql-vim'
Plugin 'elzr/vim-json'
Plugin 'fatih/vim-go'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'hashivim/vim-consul'
Plugin 'hashivim/vim-packer'
Plugin 'hashivim/vim-terraform'
Plugin 'hashivim/vim-vaultproject'
Plugin 'lepture/vim-jinja'
Plugin 'pangloss/vim-javascript'
Plugin 'saltstack/salt-vim'
Plugin 'vim-ruby/vim-ruby'

" required, plugin available after.
call vundle#end()
filetype plugin indent on
