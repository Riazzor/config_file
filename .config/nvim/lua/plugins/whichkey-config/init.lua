
local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
    print('Something went wrong with which_key')
    return
end

-- GitSigns : 
which_key.register(
    {
        g = {
            name = 'git',
            h = {
                s = '<cmd>Gitsigns stage_hunk<CR>',
                r = '<cmd>Gitsigns reset_hunk<CR>',
            }
        }
    },
    {
        mode = "n", -- NORMAL mode
        -- prefix: use "<leader>f" for example for mapping everything related to finding files
        -- the prefix is prepended to every mapping part of `mappings`
        prefix = "<leader>",

    }
)
which_key.register(
    {
        g = {
            name = 'git',
            h = {
                s = '<cmd>Gitsigns stage_hunk<CR>',
                r = '<cmd>Gitsigns reset_hunk<CR>',
            }
        }
    },
    {
        mode = "v", -- NORMAL mode
        -- prefix: use "<leader>f" for example for mapping everything related to finding files
        -- the prefix is prepended to every mapping part of `mappings`
        prefix = "<leader>",

    }
)

-- local opts = {
--     mode = "n", -- NORMAL mode
--     -- prefix: use "<leader>f" for example for mapping everything related to finding files
--     -- the prefix is prepended to every mapping part of `mappings`
--     prefix = "<leader>",
--     buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--     silent = true, -- use `silent` when creating keymaps
--     noremap = true, -- use `noremap` when creating keymaps
--     nowait = false, -- use `nowait` when creating keymaps
-- }

-- (mappings, opts)
