print("Loading init_from_vim.lua")
-- Load "lex" configuration
-- TODO: rename 'lex' to 'base'
require("lex")

-- Site specific configuration
-- Examples:
-- Path to Python 3 executable with pynvim installed
-- Will look in virtual environments for other packages
-- vim.g.python3_host_prog = "~/venvs/nvim_py312/bin/python"
require("site")
