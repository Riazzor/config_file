require("nvim-tree").setup ({
    auto_reload_on_write = true,
    reload_on_bufenter = true,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = true,
    -- hijack_directories = {
    --     enable = true,
    --     auto_open = true,
    -- },
    sync_root_with_cwd = true,
    git = {
        ignore = false,
    },
    open_on_setup = true,
    view = {
        adaptive_size = true,
        width = 35,
        mappings = {
            list = {
                -- { key = 'u', action = 'action' },
                { key = { "+", "<2-RightMouse>" },    action = "cd" },
                { key = '?', action='toggle_help' },
            },
        },
    },
    filters = {
        dotfiles = true,
    },
    renderer = {
        icons = {
            glyphs = {
    --         default = "",
    --         symlink = "",
    --         folder = {
    --           arrow_closed = "",
    --           arrow_open = "",
    --           default = "",
    --           open = "",
    --           empty = "",
    --           empty_open = "",
    --           symlink = "",
    --           symlink_open = "",
    --         },
                git = {
                    unstaged = "🟢",
                    staged = "🟡",
    --              unmerged = "",
                    unmerged = "",
                    renamed = "",
                    untracked = "⭕",
                    deleted = "🔴",
                    ignored = "⚪",
                },
            },
        },
    },
    actions = {
        open_file = {
            quit_on_open = false,
        },
    },
    live_filter = {
        always_show_folders = false,
    },
})

-- support for barbar plugin
local nvim_tree_events = require('nvim-tree.events')
local bufferline_api = require('bufferline.api')

function GetTreeSize()
    -- local vim_size = vim.o.columns
    --local tree_size = vim.api.nvim_win_get_width(0)
    ---- if tree_size == vim_size then
    --    -- In case something goes wrong
    ---- The maximum size of the window is :
    ---- vim_size - 30(default size of nvimtree) - 1(window separator)
    --if tree_size > 60 then                 -- Not perfect but works for now
    --    tree_size = 30
    --    --probably took the size of wrong window
    --    -- tree_size = vim.api.nvim_win_get_width(1000)
    --end
    -- print(tree_size)
    local tree_size = require'nvim-tree.view'.View.width
    if tree_size > 50 then
        tree_size = 50
    end
    return tree_size
end
nvim_tree_events.on_tree_open(function ()
    bufferline_api.set_offset(
        GetTreeSize()
    )
end)

nvim_tree_events.on_tree_resize(function ()
    bufferline_api.set_offset(
        GetTreeSize()
    )
end)

nvim_tree_events.on_tree_close(function ()
    bufferline_api.set_offset(0)
end)

function SignColumn()
    vim.cmd([[setlocal signcolumn=yes:1]])
end

-- nvim_tree_events.on_nvim_tree_ready(SignColumn)
-- nvim_tree_events.on_tree_open(SignColumn)
--nvim_tree_events.on_tree_resize(SignColumn)

-- Keybinding
vim.cmd [[ 
    function! SmartTree()
        if &filetype != "NvimTree"
            :NvimTreeFindFile 
        else
            :exe "normal \<C-w>\<C-p>"
        end
    endfunction
    noremap <silent> <leader>e :call SmartTree()<CR>
]]


