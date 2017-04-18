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

" Allow text to go out the side of the window
set nowrap
" Allow side scrolling character by chracter rather than half windows
set sidescroll=1

" Set the leader key to comma
:let mapleader = ","

" Save with ,w
map <Leader>w :w<CR>
" Save and exit insert mode with ,,w
imap <Leader><Leader>w <Esc>:w<CR>
" Save and close the file with ZZ, even in insert mode
imap ZZ <Esc>:wq<CR>

" Make it so that I can use jj to exit insert mode instead of <ESC>
:imap jj <Esc> 
" Also going to give jk a try, should be even faster 
:imap jk <Esc>
" Change the active buffer after a split is performed
:set splitright
" Enable line numbers
:set nu

" Fix yanking so that the cursor doesn't move when you do
" otherwise know as - make yank less jank
vnoremap <expr>y "my\"" . v:register . "y`y""`"

" Format JSON
map <Leader>j :%!python -m json.tool<CR>
" Set <Leader>t to move to the next tab
map <Leader>t :tabn<CR>
" install and build go code
" This will break if vim go is not installed
map <Leader>gi :!clear<CR>:w<CR>:GoInstall<CR>
map <Leader>gb :!clear<CR>:w<CR>:GoBuild<CR>

" A generalized function to use to toggle two commands with single repeated
" keystroke
function! ToggleMovement(firstOp, thenOp)
  let pos = getpos('.')
  execute "normal! " . a:firstOp
  if pos == getpos('.')
    execute "normal! " . a:thenOp
  endif
endfunction

" make it so that pressing 0 does ^ and again does 0
nnoremap <silent> 0 :call ToggleMovement('^', '0')<CR>

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
Plugin 'scrooloose/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'fatih/vim-go'

filetype plugin indent on     " required
" Finish Vundle Stuff

" Set the working path of cntlp to be the directory in which vim was opened
let g:ctrlp_working_path_mode = 'ra'
" Set it up so that it will look for a file called root.map to use as the
" starting location
let g:ctrlp_root_markers = ['root.map']

" Some CtrlP settings
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Settings for godef: Open definitions in a vertical split and if the
" definition is in the same file, then just move the cursor instad of 
" actually opening a new split
let g:godef_split=3
let g:godef_same_file_in_same_window=1
au FileType go nmap ds <Plug>(go-def-split)
au FileType go nmap dv <Plug>(go-def-vertical)

" Map nerd tree to be Control-n
map <C-n> :NERDTreeToggle<CR>

" Color theme settings
set background=dark
color solarized

" Make it so that the background will be transparent in iTerm2
hi Normal guibg=NONE ctermbg=NONE
