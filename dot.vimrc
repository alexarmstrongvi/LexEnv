" ==============================================================================
"
" Vim Profile for Alex Armstrong
"
" ==============================================================================

" ==============================================================================
" GENERAL CONFIGURATION
" ==============================================================================
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Assume lowercase searches are case insensitive
set smartcase

" This let mouse scroll in vim
" set mouse=

" Configure opening new files in vim:
" first tab hit will complete as much as possible,
" the second tab hit will provide a list,
" the third and subsequent tabs will cycle through completion options
set wildmode=longest,list,full
set wildmenu

" Show relative line numbers except at cursor line
set number relativenumber

" Add all files in the startup folder to path
" Allows for fuzzy-matching with :find
" Note that this can be slow for large directory structures
set path+=**

" ==============================================================================
" PATH CONFIGURATION and PLUGINS
" ==============================================================================

" Set Runtimepath
" https://github.com/jeffkreeftmeijer/vim-numbertoggle
set runtimepath^=~/.vim/plugins/number_toggle.vim
" https://github.com/godlygeek/tabular
set runtimepath^=~/.vim/plugins/Tabular.vim


" ==============================================================================
" FORMATTING
" ==============================================================================

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
set smartindent
set cindent

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab
set tabstop=8

" ==============================================================================
" DISPLAY INFO
" ==============================================================================
" Turn On Syntax
syntax enable

" Show partial commands in the last line of the screen
set showcmd

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

"set t_ti=
"set t_te=

" File searching
" Disable banner
let g:netrw_banner = 0
" Tree view of files
let g:netrw_liststyle = 3
let g:netrw_winsize = 30
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
set nu
" ==============================================================================
" AESTHETIC
" ==============================================================================

" Enable syntax highlighting
syntax on

" Turn on search highlighting
set hlsearch

" Turn on incremental highlighting
set incsearch

" Set column to alternate color for max char per line reminder
set colorcolumn=81

" Set Color Mode
"  - Color Options : blue, darkblue, default, delek, desert, elflord, evening, 
" koehler, morning, murphy, pablo, peachpuff, ron, shine, slate, torte, zellner
set t_Co=256
set background=dark
" Install cool color schemes with cmd below: 
" curl -L https://raw.githubusercontent.com/wolf-dog/sceaduhelm.vim/master/colors/sceaduhelm.vim > ~/.vim/colors/sceaduhelm.vim
" colorscheme sceaduhelm
" curl -L https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim > ~/.vim/colors/jellybeans.vim
colorscheme jellybeans
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" Turn on visual highlighting
highlight Visual cterm=reverse ctermbg=NONE

" ==============================================================================
" ALIASES and MACROS
" ==============================================================================

let mapleader = " "

nmap n nzz
nmap N Nzz
nmap <C-u> <C-u>zz
nmap <C-d> <C-d>zz

:nnoremap <leader>b :ls<CR>:buffer<Space>

nmap <leader>e :Lex<CR>

" Enable paste mode
set pastetoggle=<F10>

" Code folding based on indendation
highlight Folded ctermbg=234
highlight Folded ctermfg=243
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

" function InsertTabWrapper()
"   let col = col('.') - 1
"   if !col || getline('.')[col - 1] !~ '\k'
"     return "\<tab>"
"   else
"     return "\<c-p>"
"   endif
" endfunction
" inoremap <tab> <c-r>=InsertTabWrapper()<cr>
