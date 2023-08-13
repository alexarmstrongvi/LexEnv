" ==============================================================================
"                              Vim Configuration
" ==============================================================================

" General setup {{{
" ==============================================================================
" Do not alter Vim to be Vi-compatible
set nocompatible
" Enable file type detection
" Filetype command located at ${VIMRUNTIME}/filetype.vim (:echo $VIMRUNTIME)
filetype on
" Enable loading the plugin files for specific file types
" see ${VIMRUNTIME}/ftplugin/
filetype plugin on

" }}}
" Feature configuration {{{
" ==============================================================================
" Always prompt user before executing command that could lose unsaved changes
set confirm

" Turn off bell sounds when errors occur, instead use visual indicator
if exists('belloff')
    set belloff=all
endif

" Override the 'ignorecase' option if the search pattern contains uppercase
" characters
set smartcase

" Enable the use of the mouse (e.g. scrolling)
set mouse="a"

" Configure command-line completion (i.e. command-mode)
" 1st tab) Complete as much as possible
" 2nd tab) Provide a list
" 3+ tabs) Cycle through completion options
set wildmode=longest,list,full
" Operate in enhanced mode (i.e. pop up menu)
set wildmenu

" Search highlighting persists until manually disabled
set hlsearch
" Turn on incremental highlighting
set incsearch

" When a bracket is inserted, briefly jump to the matching one
set showmatch

" Allow backspace to delete autoindent
" set backspace=indent

" Set directory for swap files
" set noswapfile
set directory=~/.local/tmp/vim/swapfiles//,.

" Enable and set directory for undo files
set undofile
set undodir=~/.local/tmp/vim/undodir//

" Enable and set directory for backup files (
set backup
set backupdir=~/.local/tmp/vim/backupdir//

" Add all folders in the startup folder to path
" Allows for fuzzy-matching with :find
" Note that this can be slow for large directory structures (e.g ~/)
set path+=**

" File type configurations
" autocmd FileType python compiler pylint
" }}}
" Formatting {{{
" ==============================================================================
" Maximum width of text that is being inserted and autowrapped (gq)
set textwidth=80

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=10

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

" Expand tab into spaces when pressing <Tab>
set expandtab
" Number of spaces that a <Tab> (default=8)
" Set either tabstop or softtabstop but not both
" see ":help tabstop" for chooing between tabstop and softtabstop
" set tabstop=8
" Use 'softtabstop' number of spaces when pressing <Tab>
set softtabstop=4
" Number of spaces to use for shifting (>>, <<) and aligning (==)
set shiftwidth=4

" }}}
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

" Highlight the line with the cursor
set cursorline

" Set column to alternate color for max char per line reminder
set colorcolumn=+1

" Always display the status line, even if only one window is displayed
set laststatus=2

" Show select whitespace characters
if v:version >= 800
    set listchars=lead:.,tab:-->
else
    set listchars=precedes:.,tab:->
endif
set list

" Code folding
set foldenable
set foldnestmax=10
set foldmethod=indent
set foldlevelstart=1

" }}}
" Color {{{
" ==============================================================================
" Enable syntax highlighting
syntax enable

" Enables 24-bit RGB color in the TUI
" Note: Messes up colors on terminal emulators and multiplexers that don't
" support true colors
if exists('termguicolors')
    set termguicolors
endif

" Set the default shell type when vim is unable to infer
let g:is_bash = 1

" Set background color to dark mode
" Most colorschemes have a light and dark mode
set background=dark

" Set color scheme
colorscheme gruvbox
" colorscheme jellybeans
" colorscheme codedark

" Set color terminal (cterm) colors for highlight-groups
" No background for normal text
highlight Normal ctermbg=NONE
" No background for implied vim characters not actually in the text
highlight NonText ctermbg=NONE
" Reverse fg and bg colors when highlighting. No added background color
highlight Visual cterm=reverse ctermbg=NONE
" Set the bg and fg colors of folds to a dark grey
highlight Folded ctermbg=234 ctermfg=243
" Set the cursorline highlight to a dark color that is not distracting
highlight CursorLine ctermbg=233

" }}}
" Custom functions {{{
" ==============================================================================
function! TrimTrailingWhitespace()
    " See https://vim.fandom.com/wiki/Remove_unwanted_spaces
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

function! Smart_TabComplete()
    " See https://vim.fandom.com/wiki/Smart_mapping_for_tab_completion
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

function! SmoothScroll(up)
    " See https://stackoverflow.com/questions/4064651/what-is-the-best-way-to-do-smooth-scrolling-in-vim
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

" }}}
" Aliases and Macros {{{
" ==============================================================================
let mapleader = " "

" Move vertically by display lines instead of actual lines
nnoremap j gj
nnoremap k gk

" Keep cursor in same location when joining lines
nnoremap J mzJ`z

" Turn off highlighting
nnoremap <leader>noh :noh<CR>

" Keep search results centered
nnoremap n nzz
nnoremap N Nzz

" List buffer then prompt for buffer selection
nnoremap <leader>b :ls<CR>:buffer<Space>

" Shift lines up and down (just delete and yank)
" nnoremap <C-j> :m .+1<CR>==
" nnoremap <C-k> :m .-2<CR>==
" inoremap <C-j> <Esc>:m .+1<CR>==gi
" inoremap <C-k> <Esc>:m .-2<CR>==gi
" vnoremap <C-j> :m '>+1<CR>gv=gv
" vnoremap <C-k> :m '<-2<CR>gv=gv

" :help registers
" There are ten types of registers:
" 1. The unnamed register             ""
" 2. 10 numbered registers            "0 to "9
" 3. The small delete register        "-
" 4. 26 named registers               "a to "z or "A to "Z
" 5. Three read-only registers        ":, "., "%
" 6. Alternate buffer register        "#
" 7. The expression register          "=
" 8. The selection and drop registers "*, "+ and "~ 
" 9. The black hole register          "_
" 10. Last search pattern register    "/

" Paste over word, keeping pasted word in ". register
nnoremap <leader>dp "_diwP

" Copy to system clipboard ("y)
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Open netrw explorers from the directory of the current file
nnoremap <leader>e :Explore<CR>
nnoremap <leader>he :50Hexplore<CR>
nnoremap <leader>se :50Sexplore<CR>
nnoremap <leader>ve :50Vexplore!<CR>
nnoremap <leader>te :Texplore<CR>
nnoremap <leader>re :Rexplore<CR>
" Left explorer [:Lex] in Vim 8+:
" - Toggles explorer open and closed instead of opening up multiple explorers
" - Opens to current directory, not current file's directory
" - Opens new window into previously current buffer (i.e. window#2)
" - Creates new files in current directory instead of netrw directory
nnoremap <leader>le :Lexplore <CR>

" Quickfix list
nnoremap <leader>co :copen<CR>
nnoremap <leader>cnn :cnext<CR>
nnoremap <leader>cpp :cprevious<CR>
nnoremap <leader>cnf :cnext<CR>
nnoremap <leader>cpf :cprevious<CR>

" Swap word under cursor with next word, preserving any characters between them
nnoremap >w :s/\(\w*\)\%#\(\w\+\)\([^0-9A-Za-z_]\+\)\(\w\+\)/\4\3\1\2/<CR><C-o>h

" Toggle paste mode to avoid any autoformatting effects (e.g. indentation)
set pastetoggle=<F10>

" Trim trailing whitespace
nnoremap <F5> :call TrimTrailingWhitespace()<CR>

" Tab complete
if !has('nvim')
    " Neovim uses better tab complete so don't overwrite
    inoremap <Tab> <C-r>=Smart_TabComplete()<CR>
endif

" Simulate smooth scrolling
nnoremap <C-u> :call SmoothScroll(1)<Enter>
nnoremap <C-d> :call SmoothScroll(0)<Enter>

" }}}
" Plugins {{{
" ==============================================================================
" Netrw file explorer (built-in but technically a plugin)
" Disable banner
let g:netrw_banner = 0
" Listing style (i.e. how the files are listed)
let g:netrw_liststyle = 0
" Window size
let g:netrw_winsize = 20
" Behavior when selecting a file (default 0)
let g:netrw_browse_split = 0
" Keep vim's current directory the same as netrw's browsing directory.
" Otherwise, '%' creates files in the folder vim is started in
let g:netrw_keepdir = 0
" Buffer settings (default = noma nomod nonu nowrap ro nobl
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
" Set location of netrw cache files (e.g. .netrwhist)
let g:netrw_home = '~/.local/tmp/vim'

" Tabular plugin
noremap <leader>= :Tabularize<Space>/

" TODO
" New text objects:
" - Line
" - Camel case words: CamelCaseMotion
" - Function arguments: argtextobj
" - Underscore separated words:

" }}}
" Modeline {{{
" modeline for configuring just this file
" vim:foldmethod=marker:foldlevel=0
" }}}
