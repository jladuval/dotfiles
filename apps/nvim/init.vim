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

if !exists('g:vscode')
  " Add a bit extra margin to the left
  set foldcolumn=1
endif

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


set clipboard=unnamedplus,unnamed

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

set wrap "Wrap lines

if !exists('g:vscode')
  set ai "Auto indent
  set si "Smart indent
endif

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
nmap <leader>cs :let @+=expand("%")<CR>
nmap <leader>cl :let @+=expand("%:p")<CR>

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

if !exists('g:vscode')
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
    colorscheme monokai 
  endfunction

  function! LightTheme()
    set background = "light"
    colorscheme cosmic_latte 
  endfunction

  function! ToggleTheme()
    if (&background == "dark")
      :call LightTheme()
    else
      :call DarkTheme()
    endif
  endfunction

  " Switch between light and dark themes with leader l or leader d
  nnoremap <leader>= mzgg=G`z<CR>
endif

" Clear search term highlighting with leader f
nnoremap <leader>ll :noh<CR>

" Resource 
nnoremap <leader>r :source $MYVIMRC<CR>

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

" Prettier
lua require('plugins')

" NERDTree
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1
let g:NERDTreeNodeDelimiter = "\u00a0"
map <C-b> :NERDTreeToggle<CR>
map <C-n> :NERDTreeFind<CR>

if !exists('g:vscode')
  call DarkTheme()
  " TELESCOPE
  nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
  nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
  nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
endif
