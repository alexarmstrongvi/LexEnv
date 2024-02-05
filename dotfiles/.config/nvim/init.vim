" Load Vim configuration
" See https://neovim.io/doc/user/nvim.html#nvim-from-vim
echom "Autoloading init.vim"
set runtimepath^=~/.vim
set runtimepath^=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

" Load Neovim configuration
source ~/.config/nvim/init_from_vim.lua
