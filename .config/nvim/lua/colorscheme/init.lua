vim.g.tokyonight_style = "night"
-- local colorscheme = 'tokyonight'
local colorscheme = 'duskfox'

-- local colorscheme = 'nightfly'
-- local colorscheme = 'NeoSolarized'

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found')
    vim.api.nvim_command('colorscheme nordfox')
    return
end
