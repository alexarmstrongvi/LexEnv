-- Bootstrap package manager
-- code snippet from https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    print("Lazy Neovim not found. Cloning to "..lazypath)
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

--------------------------------------------------------------------------------
local lazy = require('lazy')

local plugins = {
    -- Language Server Protocol (LSP) configuration and plugins
    { 'neovim/nvim-lspconfig', dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        { 'williamboman/mason.nvim', config = true },
        'williamboman/mason-lspconfig.nvim',

        -- Setup for init.lua and plugin development with full signature
        -- help, docs and completion for the nvim lua API
        'folke/neodev.nvim',

        -- Useful status updates for LSP
        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        -- { 'j-hui/fidget.nvim', opts = {} },

    }},
    -- Highlight, edit, and navigate code
    { 'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },

    -- Colorschemes
    'Mofiqul/vscode.nvim',

    -- Autocompletion
    { 'hrsh7th/nvim-cmp',
        dependencies = {
            -- "provides manually triggered completion that can replace omnifunc"
            'hrsh7th/cmp-nvim-lsp',     -- Required
            -- Suggestions based on current buffer
            'hrsh7th/cmp-buffer',       -- Optional
            -- Suggestions base on filesystem path
            'hrsh7th/cmp-path',         -- Optional
            -- Suggestions for vim's cmdline
            'hrsh7th/cmp-cmdline',      -- Optional

            -- Snippets enable tab-completion for autocomplete suggestions and
            -- anything related to writing code automatically
            -- Snippets source for nvim-cmp
            'saadparwaiz1/cmp_luasnip',
            -- Snippets plugin
            'L3MON4D3/LuaSnip',
            -- Additional snippets
            'rafamadriz/friendly-snippets',

        },
    },

    -- "gc" to toggle commenting lines
    { 'numToStr/Comment.nvim', opts = {} },

    -- Undo Tree
    -- 'mbbill/undotree',

    -- Git integration
    -- 'tpope/vim-fugitive',
    -- 'tpope/vim-rhubarb'

    -- Detect tabstop and shiftwidth automatically
    -- 'tpope/vim-sleuth',

    -- Fuzzy finder
    { 'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- Fuzzy Finder Algorithm which requires local dependencies to be built.
            -- Only load if `make` is available. Make sure you have the system
            -- requirements installed.
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                -- NOTE: If you are having trouble with this installation,
                --       refer to the README for telescope-fzf-native for more instructions.
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
    },
}
lazy.setup(plugins)
