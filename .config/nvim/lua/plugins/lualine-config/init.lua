local get_color = require'lualine.utils.utils'.extract_highlight_colors

require'lualine'.setup{
    options = {
        theme = 'tokyonight',
        section_separators = { left = '', right = ''},
        component_separators = { left = '', right = '\\'},
        --   
        disabled_filetypes = {
            'NvimTree',
            'packer',
        },
    },
    sections = {
        lualine_b = { 'filetype' },
        lualine_c = {},
        lualine_x = { 'progress' },
        lualine_y = {
            'branch',
            {
                'diff',
                colored = true,
                diff_color = {
                    added = { fg = get_color('GitGroupAdd', 'fg') },
                    modified = { fg = get_color('GitGroupChange', 'fg') },
                    removed = { fg = get_color('GitGroupDelete', 'fg') },
                },
                symbols = {
                    added = '',
                    modified = 'ﰣ',
                    removed = '',
                },
            },
        },
    },
}

