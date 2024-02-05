local treesitter = require('nvim-treesitter.configs')
local opts = {
    -- A list of parser names, or "all" (the top five listed parsers should always be installed)
    ensure_installed = { 
        -- Required by treesitter
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        -- User specific
        "python",
        "cpp",
        "bash",
        "cmake",
        "diff",
        "git_rebase",
        "gitcommit",
        -- "gitignore",
        "make",
        "regex",
        "toml",
        "yaml"
    },
    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}
treesitter.setup(opts)
