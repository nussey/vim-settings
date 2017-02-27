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
" Also going to give jk a try, should be even faster 
:imap jk <Esc>
" Change the active buffer after a split is performed
:set splitright
" Enable line numbers
:set nu

" Format JSON
map <Leader>j :%!python -m json.tool<CR>

" Better command-line completion
set wildmenu
" Show partial commands in the last line of the screen
set showcmd
" Highlight seraches
set hlsearch
" Press Space to turn off highlighting and clear any message already
" displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

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

Plugin 'scrooloose/nerdtree'
Plugin 'ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'

filetype plugin indent on     " required
" Finish Vundle Stuff
" Set the working path of cntlp to be the directory in which vim was opened
let g:ctrlp_working_path_mode = 'ra'
" Set it up so that it will look for a file called root.map to use as the
" starting location
let g:ctrlp_root_markers = ['root.map']

" Settings for godef: Open definitions in a vertical split and if the
" definition is in the same file, then just move the cursor instad of 
" actually opening a new split
let g:godef_split=3
let g:godef_same_file_in_same_window=1
au FileType go nmap ds <Plug>(go-def-split)
au FileType go nmap dv <Plug>(go-def-vertical)

" Don't show the type information when using symantic autocomplete
" Without this, hitting tab to fill a completion opens a 2 line scratch file
" at the top of the window
set completeopt-=preview

" Map nerd tree to be Control-n
map <C-n> :NERDTreeToggle<CR>

" Color theme settings
set background=dark
color solarized

" Make it so that the background will be transparent in iTerm2
hi Normal guibg=NONE ctermbg=NONE
