-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Colorschemes
    use 'folke/tokyonight.nvim'
    use 'Mofiqul/vscode.nvim'
    -- use 'rose-pine/neovim'
    -- Unde Tree
    use 'mbbill/undotree'
    -- Git integration
    use 'tpope/vim-fugitive'
    -- Syntax parser
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        -- branch = '0.1.x',
        tag = '0.1.4',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            -- Configuration and initialization of LSPs
            {'neovim/nvim-lspconfig'},             -- Required
            -- Language server package manager
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            -- Main autocompletion plugin
            {'hrsh7th/nvim-cmp'},         -- Required
            -- Show data sent by language server
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            -- Suggestions based on current buffer
            {'hrsh7th/cmp-buffer'},       -- Optional
            -- Suggestions base on filesystem path
            {'hrsh7th/cmp-path'},         -- Optional
            -- Show snippets loaded by LuaSnip
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }
    -- Improved LSP function signature information
    use {
        "ray-x/lsp_signature.nvim",
    }
end)
