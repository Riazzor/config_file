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
    -- open_on_setup = true,
    view = {
        adaptive_size = false,
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
--local nvim_tree_events = require('nvim-tree.events')
local api = require('nvim-tree.api')
local Event = api.events.Event
local bufferline_api = require('bufferline.api')

api.events.subscribe(Event.TreeOpen, function ()
    bufferline_api.set_offset(36)
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

local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()end


vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
