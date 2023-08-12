--------------------------------------------------------------------------------
-- Imports
--------------------------------------------------------------------------------
local lspconfig = require('lspconfig')
local lsp_zero = require('lsp-zero')
local lsp_signature = require('lsp_signature')
local cmp = require('cmp')

-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
-- Helpful example config at https://github.com/neovim/nvim-lspconfig

--------------------------------------------------------------------------------
-- Choose a preset and then override specific properties below
-- :help lsp-zero-presets
lsp_zero.preset({
    name                = 'minimal',
    -- Do not override any shortcut that is already "taken"
    set_lsp_keymaps     = true,
    -- Enable all cmp behaviors
    manage_nvim_cmp     = true,
    -- Suggest LSP servers for file types without a currently available LSP
    suggest_lsp_servers = true,
})

-- Ensure language servers are installed
lsp_zero.ensure_installed({
    -- For a list of valid Neovim LSP server names, enter
    -- :help lspconfig-all
    -- Langauage server installations are managed by mason
    -- :Mason
    'lua_ls',  -- Lua (a.k.a. lua-language-server, sumneko_lua)
    'vimls',   -- Vim (a.k.a. vim-language-server)
    'pyright', -- Python
    'bashls',  -- Bash (a.k.a. bash-language-server)
    'clangd',  -- C, C++
    'neocmake',-- CMake (a.k.a. neocmakelsp)
    'yamlls',  -- YAML (a.k.a yaml-language-server)
    'hls',     -- Haskell (a.k.a. haskell-language-server)
})

--------------------------------------------------------------------------------
-- Configure autocompletion
--------------------------------------------------------------------------------
-- Make sure to setup `cmp` after lsp-zero
cmp.setup({
    mapping = {
    -- Confirm selection with enter key instead of just Ctrl-y
    ['<CR>'] = cmp.mapping.confirm({
        -- Select first item from menu if none are explicitly selected
        select = true
    }),
}
})

--------------------------------------------------------------------------------
-- Configure specific language servers
--------------------------------------------------------------------------------
lspconfig.lua_ls.setup{
    settings = {
        Lua = {
            diagnostics = {
                -- Remove warning: "Undefined global `vim`"
                globals = { 'vim' }
            }
        }
    }
}
lspconfig.vimls.setup{}
lspconfig.pyright.setup{}
lspconfig.bashls.setup{}
lspconfig.clangd.setup{}
lspconfig.neocmake.setup{}
lspconfig.yamlls.setup{}
lspconfig.hls.setup{}
lsp_signature.setup{}

--------------------------------------------------------------------------------
-- Configure diagnostic info
--------------------------------------------------------------------------------
-- TODO: Toggle on and off CursorHold show diagnostic as it can get in the way
-- while typing
vim.diagnostic.config({
    -- Disable virtual (i.e. in-line but not-selectable) text for line diagnostics
    -- It always extends off the screen so I can't read it
    virtual_text = false
})

local my_augroup = vim.api.nvim_create_augroup('my_augroup', {clear = true})
vim.api.nvim_create_autocmd(
    -- Show line diagnostics automatically in hover window when selected with cursor
    {'CursorHold', 'CursorHoldI'},
    {
        callback = function()
            vim.diagnostic.open_float(nil, {
                -- Do not automatically change focus to float once opened
                focus = false
            })
        end,
        group = my_augroup,
    }
)
--------------------------------------------------------------------------------
-- Key mappings
--------------------------------------------------------------------------------
-- Global mappings
vim.keymap.set('n', '<leader>o', vim.diagnostic.open_float)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Buffer local mappings.
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD',    vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd',    vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gi',    vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'D',     vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'K',     vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

    end,
})

--------------------------------------------------------------------------------
lsp_zero.setup()

