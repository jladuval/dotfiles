"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cursor and positioning
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the leader
let mapleader = ","
let g:mapleader = ","

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups, clipboard and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Auto reload files
set autoread
au FocusGained,BufEnter * :checktime


set clipboard=unnamed,unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" show existing tab with 4 spaces width
set tabstop=2

" " when indenting with '>', use 4 spaces width
set shiftwidth=2

" " On pressing tab, insert 4 spaces
set expandtab
set relativenumber 
set number   
set timeoutlen=1000 ttimeoutlen=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on 

" Theme
set background = "dark"
let g:airline_theme = 'one'
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set nofen
set splitright
set splitbelow
filetype plugin indent on

nnoremap <leader>cd :cd %:p:h<CR>

nnoremap <leader>f :noh<CR>

nnoremap <leader>= mzgg=G`z<CR>

" Enter for select in YCM
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"FZF
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()
nnoremap <leader>t :ProjectFiles <CR>
set rtp+=/usr/local/opt/fzf
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

""""""""""""""""""""""""""""""
" => Languages
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript setl nocindent

au FileType javascript imap <c-t> $log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return 
au FileType javascript inoremap <buffer> $f //--- PH<esc>FP2xi<Paste>

""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""
" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
" For a fresh install of YCM, you need to run the following commands on OSX after running :PlugInstall
" brew install cmake
" cd ~/.local/share/nvim/plugged/YouCompleteMe
" python install.py --js-completer --clang-completer
" sudo easy_install pip
" sudo pip2 install --upgrade neovim
" sudo pip3 install --upgrade neovim
" create ~/.tern-config (examples here https://github.com/ternjs/tern/issues/759)
" For a fresh install of YCM, you need to run the following commands on UBUNTU after running :PlugInstall
" sudo apt-get install build-essential cmake
" cd ~/.local/share/nvim/plugged/YouCompleteMe
" sudo apt-get install python-pip python-dev build-essential 
" sudo pip install --upgrade neovim
" python install.py --js-completer --clang-completer
" create ~/.tern-config (examples here https://github.com/ternjs/tern/issues/759)
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-easyclip'
"Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'moll/vim-node'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
Plug 'tomarrell/vim-npr'

call plug#end()

colorscheme onedark
