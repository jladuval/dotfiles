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
set backupcopy=yes
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

" show existing tab with 2 spaces width
set tabstop=2

" " when indenting with '>', use 2 spaces width
set shiftwidth=2

" " On pressing tab, insert 2 spaces
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

" Helper methods to copy the current file or directory to clipboard
nmap ,cs :let @+=expand("%")<CR>
nmap ,cl :let @+=expand("%:p")<CR>

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

function! DarkTheme()
  set background = "dark"
  colorscheme hypsteria
endfunction

function! LightTheme()
  set background = "light"
  colorscheme cosmic_latte 
endfunction

" Switch between light and dark themes with leader l or leader d
nnoremap <leader>d :call DarkTheme()<CR>
nnoremap <leader>l :call LightTheme()<CR>

" Clear search term highlighting with leader f
nnoremap <leader>f :noh<CR>

" Resource 
nnoremap <leader>r :source $MYVIMRC<CR>

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

" leader t opens a cool looking search screen
nnoremap <leader>t :ProjectFiles <CR>
set rtp+=/usr/local/opt/fzf
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" Use ag for :Ack; :Ack will find all instances of a word over all files in the directory
let g:ackprg = 'ag --vimgrep --smart-case -Q'                                                   
cnoreabbrev ag Ack                                                                           
cnoreabbrev aG Ack                                                                           
cnoreabbrev Ag Ack                                                                           
cnoreabbrev AG Ack 

" Grep like a winner
" bind K to grep word under cursor 
nnoremap K :Ack <cword> <CR>

" Keep search pattern at the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz

" Keep search pattern at the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
""""""""""""""""""""""""""""""
" => Languages
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""
" => Typescript
"""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""
" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" COMPLETION
" For a fresh install of YCM, you need to run the following commands on OSX after running :PlugInstall
" brew install cmake
" cd ~/.local/share/nvim/plugged/YouCompleteMe
" python install.py --js-completer --clang-completer
" sudo python -m ensurepip 
" sudo pip2 install --upgrade neovim
" sudo pip3 install --upgrade neovim
" create ~/.tern-config (examples here https://github.com/ternjs/tern/issues/759)
" For a fresh install of YCM, you need to run the following commands on UBUNTU after running :PlugInstall
" sudo apt-get install -y build-essential cmake
" cd ~/.local/share/nvim/plugged/YouCompleteMe
" sudo apt-get install -y python-pip python-dev build-essential 
" sudo pip install --upgrade neovim
" python install.py --js-completer --clang-completer
" create ~/.tern-config (examples here https://github.com/ternjs/tern/issues/759)
" Plug 'Valloric/YouCompleteMe'
" For async completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" For Denite features
Plug 'Shougo/denite.nvim'

" LANGUAGE SUPPORT
Plug 'moll/vim-node' " node support
Plug 'pangloss/vim-javascript' " JS support
Plug 'mxw/vim-jsx' " JSX support
Plug 'tomarrell/vim-npr' " Better gf
Plug 'vim-syntastic/syntastic' " Syntax highlighting
Plug 'jparise/vim-graphql' " Graphql highlighting
Plug 'leafgarland/typescript-vim' " Typescript support
Plug 'HerringtonDarkholme/yats.vim' " Generic typescript highlighting
Plug 'mhartington/nvim-typescript', {'do': './install.sh'} " Needed to support typescript linting 
Plug 'ianks/vim-tsx' " TSX support

" SYNTAX
Plug 'tpope/vim-surround' " S surrounds stuff
Plug 'tpope/vim-repeat' " . works better
Plug 'tpope/vim-commentary' " use gc to comment blocks
Plug 'tpope/vim-abolish' " better search and replace
Plug 'Quramy/vim-js-pretty-template' " highlights graphql and html in template strings
Plug 'dense-analysis/ale' " Linting

" NAVIGATION
Plug 'christoomey/vim-tmux-navigator' " tmux and vim play nicely together
Plug 'scrooloose/nerdtree' " Nerdtree
Plug 'svermeulen/vim-easyclip' " better clipboard
Plug 'junegunn/fzf', { 'do': 'yes \| ./install' } " Find files
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim' " Search with ack

" OTHER
Plug 'tpope/vim-fugitive' " git support, basically only used to get :Gcd
Plug 'godlygeek/tabular' " tab multiple lines
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" THEMES
Plug 'joshdick/onedark.vim'
Plug 'nightsense/cosmic_latte'
Plug 'BrainDeath0/Hypsteria'

" Plugin settings
" Syntastic
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_args=['-c', 'mishguru', '--ext', '.js,.jsx']
let g:syntastic_json_checkers=['jsonlint']
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_html_checkers=['']
let g:syntastic_always_populate_loc_list = 1

" vim-typescript
" let g:typescript_compiler_binary = 'tsc '
" let g:typescript_compiler_options = '--declaration true --diagnostics true --esModuleInterop true --forceConsistentCasingInFileNames true --module commonjs --moduleResolution node --noImplicitAny true --noUnusedLocals false --noUnusedParameters true --removeComments true --lib es2019 --strict false --resolveJsonModule true'

" ale
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'tslint'],
\   'vue': ['eslint']
\}

let g:ale_fixers = {
\    'javascript': ['eslint'],
\    'typescript': ['prettier'],
\    'vue': ['eslint'],
\    'scss': ['prettier'],
\    'html': ['prettier']
\}

let g:ale_fix_on_save = 1

" deplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" vim-js-pretty-template
autocmd FileType typescript JsPreTmpl
autocmd FileType typescript syn clear foldBraces " For leafgarland/typescript-vim users only

" vim-javascript
let g:javascript_plugin_flow = 1

" vim-npr
" SEE plugins/after
autocmd BufEnter *.ts,*.js,*.jsx,*.css,*.coffee nmap <buffer> gf :call VimNPRFindFile("")<CR>

" NERDTree
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1
let g:NERDTreeNodeDelimiter = "\u00a0"
map <C-b> :NERDTreeToggle<CR>
map <C-n> :NERDTreeFind<CR>

call plug#end()

call DarkTheme()
