filetype off
filetype plugin indent on

" be iMproved
set nocompatible

" load plugins from vundle
source ~/.vim/plugins.vim


" ----- UI settings -----
set wildmenu                                " enhanced command line completion
set wildmode=list:longest,full              " complete files like a shell

set showcmd                                 " always display commands.
set showmode                                " show the mode we're currently in.
set showmatch                               " highlight matching brackets/showbraces.

set number                                  " show current line number
set ruler                                   " show the ruler
set cursorline                              " visualize current line.
set laststatus=2                            " show the status line
set statusline=%F[%L][%{&ff}][%p%%][%l,%v]  " configure the status line
set colorcolumn=80                          " mark the 80 char column.

"set paste                                   " don't suck at pasting
set pastetoggle=<F2>                        " set pastetoggle
set backspace=2                             " make backspace work like most other apps

" error bells
set noerrorbells                            " disable error bells.
set visualbell                              " disable error bells.
set t_vb=                                   " disable error bells.
set tm=500                                  " disable error bells.


" ----- General -----

" detect when a file is changed
set autoread

" set a map leader for more key combos
let mapleader = ','
let g:mapleader = ','

" use osx default clipboard
set clipboard=unnamed

" faster redrawing
set ttyfast

" make backspace work like most other apps
set backspace=2

" add ide like completiong popup menu
set completeopt+=longest

" tab formating
set expandtab                               " expand tabs to spaces.
set smarttab                                " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=2                               " the visible width of tabs
set softtabstop=2                           " edit as if the tabs are 4 characters wide
set shiftwidth=2                            " number of spaces to use for indent and unindent
set shiftround                              " round indent to a multiple of 'shiftwidth'


" ----- Syntax and Color -----

" switch syntax highlighting on
syntax on

" set colorscheme
colorscheme solarized
set background=dark

" set encoding
set encoding=utf8

" explicitly tell vim that the terminal supports 256 colors
set t_Co=256

" python syntax
let python_highlight_all=1


" -----  Plugins -----

" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let NERDTreeShowHidden=1
" remove some files by extension
let NERDTreeIgnore = ['\.js.map$']
" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>
" vim-nerdtree-tabs
"let g:nerdtree_tabs_open_on_console_startup=1
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" map fuzzyfinder (CtrlP) plugin
" nmap <silent> <leader>t :CtrlP<cr>
nmap <silent> <leader>r :CtrlPBuffer<cr>
let g:ctrlp_map='<leader>t'
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'

" Fugitive Shortcuts
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>

" toggle syntastic
nmap <leader>s :SyntasticToggleMode<cr>

" airline options
let g:airline_powerline_fonts=1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_theme='base16'

" YouCompleteMe
"let g:ycm_autoclose_preview_windows_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<cr>

" split
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
