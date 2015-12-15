" Set indentation settings
" Autodetect indention settings
set autoindent
" Set up space based tabs
set shiftwidth=2
set expandtab
set softtabstop=2
" Configure hard tabs
set tabstop=2

" Enable syntax based highlighting
syntax enable

" Make it so that I can use jj to exit insert mode instead of <ESC>
:imap jj <Esc> 
" Change the active buffer after a split is performed
:set splitright
" Enable line numbers
:set nu

" Better command-line completion
set wildmenu
" Show partial commands in the last line of the screen
set showcmd
" Highlight seraches
set hlsearch
" Press Space to turn off highlighting and clear any message already
" displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
:nnoremap } ]}

" Use case insensitive serach, except when using capital letters
set ignorecase
set smartcase

" Set incremental search
set incsearch

" Who knows
set nocompatible

"Start Vundle Stuff
filetype off

" git clone https://github.com/gmarik/vundle.git /your/.vim/bundle/vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-haml'

Plugin 'leafgarland/typescript-vim'
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'vim-scripts/YankRing.vim'
Plugin 'dgryski/vim-godef'

filetype plugin indent on     " required
" Finish Vundle Stuff
" Set the working path of cntlp to be the directory in which vim was opened
let g:ctrlp_working_path_mode = 'ra'
" Allow for the cycling through of previous deletes when pasting
let g:yankring_replace_n_pkey = '<C-y>'
let g:yankring_replace_n_nkey = '<C-T>'
" Do not save single characters to the yank ring
let g:yankring_min_element_length = 2 

" Settings for godef: Open definitions in a vertical split and if the
" definition is in the same file, then just move the cursor instad of 
" actually opening a new split
let g:godef_split=3
let g:godef_same_file_in_same_window=1


" Map nerd tree to be Control-n
map <C-n> :NERDTreeToggle<CR>

" Map the next tab key
map <C-f> :tabn<CR>
nnoremap <C-r> :tabp<CR>

" Make easier window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Color theme settings
set background=dark
color solarized
