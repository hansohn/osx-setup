set nocompatible
filetype off

" vim-plug
call plug#begin()

" colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/everforest'

" lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" NERDtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" languages
Plug 'sheerun/vim-polyglot'

" linting
Plug 'dense-analysis/ale'

" aesthetics
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" required, plugin available after.
call plug#end()
filetype plugin indent on
