" Set indentation settings
" Autodetect indentino settings
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

" Use case insensitive serach, except when using capital letters
set ignorecase
set smartcase

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Who knows
set nocompatible
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

" Set the working path of cntlp to be the directory in which vim was opened
let g:ctrlp_working_path_mode = 'c'

" Map nerd tree to be Control-n
map <C-n> :NERDTreeToggle<CR>

filetype plugin indent on     " required

set background=dark
color solarized
