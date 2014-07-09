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
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'ervandew/supertab'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'Shougo/neosnippet.vim'
Bundle 'Shougo/neosnippet-snippets'
" make in .vim/bundle/vimproc.vim/
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/vimshell.vim'
Bundle 'davidhalter/jedi-vim'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'plasticboy/vim-markdown'
Bundle 'mattn/emmet-vim'
Bundle 'othree/html5.vim'
Bundle 'lepture/vim-css'
Bundle 'xolox/vim-misc'
" npm install in .vim/bundle/tern_for_vim/
Bundle 'marijnh/tern_for_vim'
Bundle 'scrooloose/syntastic'
Bundle 'Raimondi/delimitMate'
" vim-scripts repos
Bundle 'The-NERD-Commenter'
Bundle 'The-NERD-tree'
Bundle 'Tagbar'
Bundle 'Colortest'
Bundle 'AfterColors.vim'
Bundle 'ctrlp.vim'
Bundle 'surround.vim'
Bundle 'EasyMotion'
Bundle 'Solarized'
Bundle 'Distinguished'
Bundle 'xoria256.vim'
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

" Set folding
" set foldmethod=indent

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

functio! GetRunningOS()
    if has('win32')
        return 'win'
    endif
    if has('unix')
        if system('uname')=~'Darwin'
            return 'mac'
        else
            return 'linux'
        endif
    endif
endfunction
let os = GetRunningOS()

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

"colorscheme solarized
"let g:solarized_termcolors=256
"set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set background=dark
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
    if os=='mac'
        set background=dark
        colorscheme solarized
    else
        set background=dark
        colorscheme desert
    endif
else
    if os=='mac'
        set background=light
        colorscheme desert
    else
        set t_Co=256
        set background=dark
        colorscheme distinguished
    endif
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
map <c-t> :tabnew<cr>
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
nmap <leader>wq :wq<cr>
nmap <leader>w :w<cr>
nmap <leader>wa :wa<cr>
nmap <C-s> :w<cr>
nmap ; A;<esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" BufExplorer
""""""""""""""""""""""""""""""
let g:bufExplorerSplitBelow=1
let g:bufExplorerShowDirectories=1
let g:bufExplorerSplitRight=1

""""""""""""""""""""""""""""""
" nerdTree
""""""""""""""""""""""""""""""
nmap <silent> <leader>nt :NERDTree<cr>

""""""""""""""""""""""""""""""
" surrond
""""""""""""""""""""""""""""""
imap <leader>s <C-s>

""""""""""""""""""""""""""""""
" SuperTab
""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType='context'

""""""""""""""""""""""""""""""
" NeoComplCache
""""""""""""""""""""""""""""""
let g:neocomplcache_enable_at_startup = 1

""""""""""""""""""""""""""""""
" NeoSnippet
""""""""""""""""""""""""""""""
" Plugin key-mappings"
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
"SuperTab like snippets behavior."
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

let g:neocomplcache_max_list = 8
"let g:neosnippet#enable_snipmate_compatibility = 1
"let g:neosnippet#snippets_directory=""

""""""""""""""""""""""""""""""
" Vim-Markdown
""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1

"ejs syntax highlight
function! EJS_Configuration()
    set filetype=html
    let g:surround_{char2nr("%")} = "<% \r %>"
    let g:surround_{char2nr("-")} = "<%- \r %>"
    let g:surround_{char2nr("=")} = "<%= \r %>"
endfunction
au BufNewFile,BufRead *.ejs :call EJS_Configuration()<cr>

""""""""""""""""""""""""""""""
" VimShell
""""""""""""""""""""""""""""""
if os=='mac'
    let g:vimshell_editor_command = '/opt/local/bin/mvim'
endif

""""""""""""""""""""""""""""""
" Jedi
""""""""""""""""""""""""""""""
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0
let g:jedi#popup_select_first = 0

""""""""""""""""""""""""""""""
" NeoComplCache <> Jedi
""""""""""""""""""""""""""""""
" make neocomplcache use jedi#completions omini function for python scripts
if !exists('g:neocomplcache_omni_functions')
    let g:neocomplcache_omni_functions = {}
    let g:neocomplcache_omni_functions['python'] = 'jedi#completions'
endif
" make Vim call omni function when below patterns matchs
let g:neocomplcache_force_omni_patterns = {}
let g:neocomplcache_force_omni_patterns.python = '[^. \t]\.\w*'

""""""""""""""""""""""""""""""
" Syntastic
""""""""""""""""""""""""""""""
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_check_on_open = 1
