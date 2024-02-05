print("Loading init_from_vim.lua")
-- Load "lex" configuration
-- TODO: rename 'lex' to 'base'
require("lex")

-- Path to Python 3 executable with pynvim installed
-- Will look in virtual environments for other packages
vim.g.python3_host_prog = "~/MyDocuments/Coding/venvs/nvim_py3.11/bin/python"
