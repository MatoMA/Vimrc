"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'The-NERD-tree'
Bundle 'taglist.vim'
Bundle 'SuperTab'
Bundle 'Colortest'
Bundle 'AfterColors.vim'
Bundle 'Command-T'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" enable mouse
set mouse=a

" line number
set nu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

colorscheme desert
"colorscheme solarized
"let g:solarized_termcolors=256
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Resize windows
nmap <leader>< 20<C-W><
nmap <leader>> 20<C-W>>

" Files Explore
map <leader>ex :Explore<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <leader>e <Esc>
" Remap VIM 0 to first non-blank character
map 0 ^

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Copy and paste
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap <C-c> "+y
nmap <C-v> "+p

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick function
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>q :q<cr>
nmap <leader>qa :qa<cr>
nmap <leader>w :w<cr>

""""""""""""""""""""""""""""""
" BufExplorer
""""""""""""""""""""""""""""""
let g:bufExplorerSplitBelow=1
let g:bufExplorerShowDirectories=1
let g:bufExplorerSplitRight=1

""""""""""""""""""""""""""""""
" Alternate
""""""""""""""""""""""""""""""
nmap <leader>al :A<cr>
nmap <leader>vsal :abo vs<cr>:A<cr>
nmap <leader>spal :abo sp<cr>:A<cr>

""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = '/opt/local/bin/ctags'
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口
let Tlist_WinWidth = 50
set tags=tags;
set autochdir 
nmap <leader>tl :Tlist<cr>
nmap <leader>vtag :bel vs<cr><C-]>
nmap <leader>stag :bel sp<cr><C-]>

""""""""""""""""""""""""""""""
" nerdTree
""""""""""""""""""""""""""""""
nmap <silent> <leader>nt :NERDTree<cr>