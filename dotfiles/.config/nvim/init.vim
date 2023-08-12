"  Share configuration from vim
" See https://neovim.io/doc/user/nvim.html#nvim-from-vim
echom "Autoloading init.vim"
set runtimepath^=~/.vim
" set runtimepath^=~/.vim/after " Causing NVIM crash
let &packpath=&runtimepath
source ~/.vimrc

source ~/.config/nvim/init_from_vim.lua
