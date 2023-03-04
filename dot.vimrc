" ==============================================================================
" Vim Configuration
" ==============================================================================

" ==============================================================================
" Vim under-the-hood behavior {{{
" ==============================================================================
" Do not alter Vim to be more Vi-compatible
set nocompatible
" Enable file type detection
filetype on
" Enable loading the plugin files for specific file types
filetype plugin on
" }}}

" ==============================================================================
" Feature configuration {{{
" ==============================================================================
" Always prompt user before executing command that could lose unsaved changes
set confirm

" Override the 'ignorecase' option if the search pattern contains uppercase
" characters
set smartcase

" Enable the use of the mouse (e.g. scrolling)
set mouse="a"

" Configure command-line completion (i.e. command-mode)
" 1st tab) Complete as much as possible
" 2nd tab) Provide a list
" 3+ tab) Cycle through completion options
set wildmode=longest,list,full
" Operate in enhanced mode (i.e. pop up menu)
set wildmenu

" Turn on search highlighting
set hlsearch
" Turn on incremental highlighting
set incsearch

" When a bracket is inserted, briefly jump to the matching one
set showmatch

" Add all folders in the startup folder to path
" Allows for fuzzy-matching with :find
" Note that this can be slow for large directory structures (e.g ~/)
set path+=**

" NetRW file explorter
" Disable banner
let g:netrw_banner = 0
" Listing style (1 = one file per line with file info)
let g:netrw_liststyle = 1
" Window size
let g:netrw_winsize = 30
" Buffer settings (default = noma nomod nonu nowrap ro nobl
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro nobl'
" }}}

" ==============================================================================
" Formatting {{{
" ==============================================================================
" Maximum width of text that is being inserted and autowrapped (gq)
set textwidth=80

" See https://vim.fandom.com/wiki/Indenting_source_code
" Automatically add indentation when starting a new line
set autoindent
" Enable loading the indent file for specific file types
filetype indent on
" If file type based indentation is not great try 'smartindent' and 'cindent'
" Try to be smart about when/how to add indentation
" set smartindent
" Use C indenting rules
" set cindent

" Number of spaces that a <Tab> (default=8)
" set tabstop=8
" Use 'softtabstop' number of spaces when pressing <Tab>
set expandtab
set softtabstop=4
" Number of spaces to use for shifting (>>, <<) and aligning (==)
set shiftwidth=4
" }}}

" ==============================================================================
" Interface {{{
" ==============================================================================
" Add line numbers in hybrid mode
set number relativenumber
" Toggle between hybrid and absolute line numbers in a smart way
" see https://jeffkreeftmeijer.com/vim-number/
augroup numbertoggle
  autocmd!
  " Hybrid when focused on a buffer in normal mode
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  " Absolute in insert mode or when not focused on the window
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" Show partial commands in the last line of the screen
set showcmd

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Set column to alternate color for max char per line reminder
set colorcolumn=+1

" Highlight the text line of the cursor

" Always display the status line, even if only one window is displayed
set laststatus=2

" Show whitespace
set listchars=space:.,tab:-->
set list

" Code folding based on indentation
set foldenable
set foldnestmax=10
set foldmethod=indent
" TODO: Fix below
" augroup vimrc
"     " Set foldmethod upon loading file
"     au BufReadPre * setlocal foldmethod=indent
"     " Switch from automatic to manual folding after the buffer is displayed
"     au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
" augroup END
" }}}

" ==============================================================================
" Color {{{
" ==============================================================================
" Enable syntax highlighting
syntax enable

" Set number of available colors (necessary?)
" set t_Co=256

" Set background color to dark mode
" Most colorschemes have a light and dark mode
set background=dark

" Set color scheme
"colorscheme jellybeans
colorscheme gruvbox

" Set color terminal (cterm) colors for highlight-groups
highlight Normal ctermbg=NONE
highlight NonText ctermbg=NONE
highlight Visual cterm=reverse ctermbg=NONE
highlight Folded ctermbg=234
highlight Folded ctermfg=243
" }}}

" ==============================================================================
" Aliases and Macros {{{
" ==============================================================================
let mapleader = " "

" Move vertically by display lines instead of actual lines
nnoremap j gj
nnoremap k gk

" Turn of highlighting
nnoremap <leader>noh :noh<CR>

" Keep search results centered
nnoremap n nzz
nnoremap N Nzz

" List buffer then prompt for buffer selection
nnoremap <leader>b :ls<CR>:buffer<Space>

" Shift lines up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi

"Toggle explorer
nnoremap <leader>e :Lexplore<CR>
nnoremap <leader>te :Texplore<CR>

" Toggle paste mode to avoid any autoformatting effects (e.g. indentation)
set pastetoggle=<F10>

" Trim trailing whitespace
" See https://vim.fandom.com/wiki/Remove_unwanted_spaces
function! TrimTrailingWhitespace()
    " Save last search term
    let _s=@/
    " Save last cursor position
    let l = line(".")
    let c = col(".")
    " Trim trailing whitespace
    %s/\s\+$//e
    " Reset search term
    let @/=_s
    " Reset cursor position
    call cursor(l, c)
endfunction
nnoremap <F5> :call TrimTrailingWhitespace()<CR>

"-------------------------------------------------------------------------------
" Tab complete
" https://vim.fandom.com/wiki/Smart_mapping_for_tab_completion
function! Smart_TabComplete()
    " Get text of current line
    let line = getline('.')
    " from the start of the current line to one character right of the cursor
    let substr = strpart(line, -1, col('.')+1)
    " word till cursor
    let substr = matchstr(substr, "[^ \t]*$")
    if (strlen(substr)==0)
        " nothing to match on empty string
        return "\<Tab>"
    endif
    " position of period, if any
    let has_period = match(substr, '\.') != -1
    " position of slash, if any
    let has_slash = match(substr, '\/') != -1
    if (!has_period && !has_slash)
        " existing text matching
        return "\<C-x>\<C-p>"
    elseif ( has_slash )
        " file matching
        return "\<C-x>\<C-f>"
    else
        " plugin matching
        return "\<C-x>\<C-o>"
    endif
endfunction
inoremap <Tab> <C-r>=Smart_TabComplete()<CR>

"-------------------------------------------------------------------------------
" Simulate smooth scrolling
" See https://stackoverflow.com/questions/4064651/what-is-the-best-way-to-do-smooth-scrolling-in-vim
"nmap <C-u> <C-u>zz
"nmap <C-d> <C-d>zz
let scroll=28
function SmoothScroll(up)
    if a:up
        let scrollaction="\<C-y>"
    else
        let scrollaction="\<C-e>"
    endif
    exec "normal " . scrollaction
    redraw
    let counter=1
    while counter<&scroll
        let counter+=1
        sleep 10m
        redraw
        exec "normal " . scrollaction
    endwhile
endfunction
" Add shortcut for normal and insert mode
nnoremap <C-u> :call SmoothScroll(1)<Enter>
nnoremap <C-d> :call SmoothScroll(0)<Enter>

" }}}

" ==============================================================================
" Plugins {{{
" ==============================================================================
" Tabular plugin
noremap <leader>= :Tab<Space>/
" }}}

" modeline for configuring just this file
" vim:foldmethod=marker:foldlevel=0
