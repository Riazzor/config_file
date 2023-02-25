
require'gitsigns'.setup{
    signs = {
        add          = {hl = 'GitGroupAdd'   , text = '│', numhl='GitGroupAdd'   , linehl='GitGroupAdd'},
        change       = {hl = 'GitGroupChange', text = '│', numhl='GitGroupChange', linehl='GitGroupChange'},
        delete       = {hl = 'GitGroupDelete', text = '', numhl='GitGroupDelete', linehl='GitGroupDelete'},
        topdelete    = {hl = 'GitGroupDelete', text = '', numhl='GitGroupDelete', linehl='GitGroupDelete'},
        changedelete = {hl = 'GitGroupChange', text = '~', numhl='GitGroupChange', linehl='GitGroupChange'},
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then return '<C-j>' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        map('n', '[c', function()
            if vim.wo.diff then return '<C-k>' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        -- Actions
        -- map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
        -- map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
        -- map('n', '<leader>hS', gs.stage_buffer)
        -- map('n', '<leader>hu', gs.reset_hunk)
        -- map('n', '<leader>hR', gs.reset_buffer)
        -- map('n', '<leader>hp', gs.preview_hunk)
        -- map('n', '<leader>hb', function() gs.blame_line{full=true} end)
        -- map('n', '<leader>tb', gs.toggle_current_line_blame)
        -- map('n', '<leader>hd', gs.diffthis)
        -- map('n', '<leader>hD', function() gs.diffthis('~') end)
        -- map('n', '<leader>td', gs.toggle_deleted)

        -- Text object
        map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
}
