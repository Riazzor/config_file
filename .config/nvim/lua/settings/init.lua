-- Basic settings
local global_options = {
    clipboard = 'unnamedplus',                               -- yank, delete, change will copy to clipboard
    completeopt = 'menu,menuone,noselect,preview,noinsert',        -- type of popup menu : not sure yet  'longest' to write all common character
    winblend = 10,
    pumblend = 20,                                           -- Popup menu opacity (0 to 100)
    pumheight = 20,                                          -- Popup menu height
    encoding = 'utf-8',
    timeoutlen = 300,                                        -- time to wait for key mapping in milliseconds
    compatible = false,                                      -- with vi 
    hlsearch = true,
    signcolumn = 'yes',
    scrolloff = 999,
    cursorline = true,
    confirm = true,
    undofile = true,
    undolevels = 400,
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    autoindent = true,
    splitbelow = true,
    splitright = true,
    cmdheight = 2,
    smartcase = true,
    whichwrap = '<,>,[,],h,l',
    mouse = 'nv',
    termguicolors = true,
    listchars = 'tab: ',
    list = true,
    -- updatetime = 2000,
}
for option, value in pairs(global_options) do
    vim.o[option] = value
end
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.colorcolumn = '120'


-- Command that I can't find lua equivalent.
vim.api.nvim_command('set path+=**')

-- Highlight group
vim.cmd[[highlight ColorColumn ctermbg=7 ctermfg=0]]
vim.cmd[[highlight ErrorMsg ctermfg=0]]
vim.cmd[[highlight GitGroupAdd guifg='#19b919']]
vim.cmd[[highlight GitGroupChange guifg='#007fd2']]
vim.cmd[[highlight GitGroupDelete guifg='#c60800']]
vim.cmd[[let g:python3_host_prog = '/home/florent/.local/share/virtualenvs/nvim/bin/python3']]
-- vim.cmd[[set foldmethod=indent]]
-- vim.cmd[[set foldlevel=2]]
-- vim.cmd[[set foldclose=all]]
-- vim.cmd[[set foldopen=all]]
vim.cmd([[
    augroup python_file
        autocmd!
        autocmd focuslost,bufleave *.py,*.html,*.css,*.js write <afile> | stopinsert 
    augroup end
]])
-- Autocommands
-- this one is for compiling everytime the plugins file are modified(packer)
vim.cmd([[
    if !exists('*PostWriteLuaConfig')
        function! PostWriteLuaConfig()
            luafile <afile>
            exec "stopinsert"
            PackerSync
        endfunction
    endif

    augroup packer_user_config
        autocmd!
        autocmd BufWritePost init.lua stopinsert | call PostWriteLuaConfig()
        autocmd BufWritePost installed-plugins.lua call PostWriteLuaConfig()
        autocmd BufLeave *.lua write <afile> 
    augroup end
]])
