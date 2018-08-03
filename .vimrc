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
set mouse=a

" Configure opening new files in vim:
" first tab hit will complete as much as possible,
" the second tab hit will provide a list,
" the third and subsequent tabs will cycle through completion options
set wildmode=longest,list,full
set wildmenu


" ==============================================================================
" PATH CONFIGURATION and PLUGINS
" ==============================================================================

" Set Runtimepath
set runtimepath^=~/.vim/plugins/number_toggle.vim

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
set tabstop=4

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

" Display line numbers on the left
set number

" Always display the status line, even if only one window is displayed
set laststatus=2

" ==============================================================================
" AESTHETIC
" ==============================================================================

" Enable syntax highlighting
syntax on

" Turn on search highlighting
set hlsearch

" Set Color Mode
"  - Color Options : blue, darkblue, default, delek, desert, elflord, evening, 
" koehler, morning, murphy, pablo, peachpuff, ron, shine, slate, torte, zellner
" colo default "Set by Xterm  

set background=dark
"  solarized options 
let g:solarized_termcolors=16
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
" colorscheme solarized

" ==============================================================================
" ALIASES and MACROS
" ==============================================================================

" Enable paste mode
set pastetoggle=<F10>

" Code folding based on indendationy
:hi Folded ctermbg=DarkGrey
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

" This tab-completes in C++
 function InsertTabWrapper()
   let col = col('.') - 1
   if !col || getline('.')[col - 1] !~ '\k'
     return "\<tab>"
   else
     return "\<c-p>"
   endif
 endfunction
 inoremap <tab> <c-r>=InsertTabWrapper()<cr>
