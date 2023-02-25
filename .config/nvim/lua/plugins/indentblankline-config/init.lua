vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f2335 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#3b4261 gui=nocombine]]

local status_ok, indent_blankline = pcall(require, 'indent_blankline')
if not status_ok then
    print('Something went wrong with indent_blankline')
    return
end

indent_blankline.setup {
    char = "",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
    space_char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
    show_trailing_blankline_indent = false,
}
