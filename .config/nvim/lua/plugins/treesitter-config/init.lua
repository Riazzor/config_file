
require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'python',
        'html',
        'css',
        'lua',
        'make',
        'json',
        'javascript',
        'vim',
    },

    highlight = {
        enable = true,
    },

    context_commentstring = {
        enable = true,
        config = {
            python = '# %s',
            lua = '-- %s'
        }
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    indent = {
        enable = true,
    },
    rainbow = {
        enable = true,
    },
}


