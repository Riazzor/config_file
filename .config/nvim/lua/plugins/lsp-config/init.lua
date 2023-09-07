-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
-- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)    -- Just don't see the utility for now
map("n", "<F8>", vim.diagnostic.goto_next, opts)
map("n", "<F20>", vim.diagnostic.goto_prev, opts)            -- This is <S-F8>
map("n", "<leader>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
local function lsp_keymap(bufnr)
    --    map("n", "gD", vim.lsp.buf.declaration, bufopts)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    map("n", "gd", vim.lsp.buf.definition, bufopts)
    -- map("n", "gD", vim.lsp.buf.references, bufopts)
    map("n", "K", vim.lsp.buf.hover, bufopts)
    -- map("n", "gi", vim.lsp.buf.implementation, bufopts)
    map("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    map("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    -- map("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
    map("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    map("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
    map("v", "<leader>ca", vim.lsp.buf.code_action, bufopts)
    -- map("n", "<leader>f", vim.lsp.buf.formatting, bufopts)
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_command([[autocmd CursorHold,CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]])
    vim.api.nvim_command([[autocmd CursorMoved,CursorMovedI <buffer> lua vim.lsp.buf.clear_references()]])
  end
end

-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    lsp_keymap(bufnr)
    lsp_highlight_document(client)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 300,
}

-- luasnip and cmp setup
-- local luasnip_status_ok, luasnip = pcall(require, "luasnip")
-- if not luasnip_status_ok then
--     vim.notify("Something went wrong with Luasnip")
--     return
-- end
-- local cmp_status_ok, cmp = pcall(require, "cmp")
-- if not cmp_status_ok then
--     vim.notify("Something went wrong with nvim-cmp")
--     return
-- end

-- local kind_icons = {
--     Text = "",
--     Method = "m",
--     Function = "",
--     Constructor = "",
--     Field = "",
--     Variable = "",
--     Class = "",
--     Interface = "",
--     Module = "",
--     Property = "",
--     Unit = "",
--     Value = "",
--     Enum = "",
--     Keyword = "",
--     Snippet = "",
--     Color = "",
--     File = "",
--     Reference = "",
--     Folder = "",
--     EnumMember = "",
--     Constant = "",
--     Struct = "",
--     Event = "",
--     Operator = "",
--     TypeParameter = "",
-- }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.foldingRange = {
--     dynamicRegistration = false,
--     lineFoldingOnly = true
-- }
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- -- nvim-cmp setup
-- cmp.setup {
--     completion = {
--         autocomplete = true
--     },
--     snippet = {
--         expand = function(args)
--             luasnip.lsp_expand(args.body)
--         end,
--     },
--     mapping = cmp.mapping.preset.insert({
--         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--         ["<C-Space>"] = cmp.mapping.complete(),
--         ["<C-f>"] = cmp.mapping.scroll_docs(4),
--         ["<CR>"] = cmp.mapping.confirm {
--             behavior = cmp.ConfirmBehavior.Replace,
--             select = true,
--         },
--         ["<Tab>"] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--                 cmp.select_next_item()
--             elseif luasnip.expand_or_jumpable() then
--                 luasnip.expand_or_jump()
--             else
--                 fallback()
--             end
--         end, { "i", "s" }),
--         ["<S-Tab>"] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--                 cmp.select_prev_item()
--             elseif luasnip.jumpable(-1) then
--                 luasnip.jump(-1)
--             else
--                 fallback()
--             end
--         end, { "i", "s" }),
--     }),
--     formatting = {
--         fields = { "kind", "abbr", "menu" },
--         format = function(entry, vim_item)
--             -- Kind icons
--             vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
--             vim_item.menu = ({
--                 nvim_lsp = "[LSP]",
--                 buffer = "[Buffer]",
--                 luasnip = "[LuaSnip]",
--                 nvim_lua = "[Lua]",
--                 latexsymbols = "[LaTex]",
--                 path = "[Path]",
--             })[entry.source.name]
--             return vim_item
--         end
--     },
--     sources = {
--         { name = "nvim_lsp" },
--         { name = "luasnip" },
--         { name = "nvim_lua" },
--         { name = "buffer" },
--         { name = "path" },
--         { name = "cmdline" },
--     },
--     window = {
--         documentation = cmp.config.window.bordered(),
--     },
-- }
-- lsp_installer

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    vim.notify("Something went wrong with lspconfig")
    return
end
local lsp_mason_status_ok, lsp_mason = pcall(require, "mason")
if not lsp_mason_status_ok then
    vim.notify("Something went wrong with mason")
    return
end
local lsp_mason_bridge_status_ok, lsp_mason_bridge = pcall(require, "mason-lspconfig")
if not lsp_mason_bridge_status_ok then
    vim.notify("Something went wrong with mason")
    return
end
lsp_mason.setup {}
lsp_mason_bridge.setup {}

-- =================
-- PYTHON
-- =================

lspconfig.pylsp.setup {
    cmd = { "pylsp" },
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                strictParameterNoneValue = false,
            },
        },
    },
}
-- NO SUPPORT FOR PYENV VENV. (27/02/2023)
-- lspconfig.pyright.setup {
--     cmd = { "pyright-langserver", "--stdio" },
--     on_attach = on_attach,
--     flags = lsp_flags,
--     capabilities = capabilities,
--     settings = {
--         python = {
--             analysis = {
--                 strictParameterNoneValue = false,
--             },
--         },
--     },
-- }

-- =================
-- LUA
-- =================

lspconfig.lua_ls.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "use" },
            },
            telemetry = {
                enable = false,
            },
        },
    },

}

-- =================
-- HTML
-- =================

lspconfig.html.setup{
    cmd = { "vscode-html-language-server", "--stdio" },
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    filetypes = { "html" },
    init_options = {
        configurationSection = { "html", "css", "javascript" },
        embeddedLanguages = {
            css = true,
            javascript = true
        },
        provideFormatter = true
    },
    -- root_dir = function() return vim.loop.cwd() end,
    -- settings = {},
    single_dile_support = true,
}

-- =================
-- JSON
-- =================

lspconfig.jsonls.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,

}

-- =================
-- c language
-- =================

lspconfig.clangd.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,

}


lspconfig.spectral.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
}

vim.api.nvim_create_user_command(
    'Format',
    'lua vim.lsp.buf.format { async = true }',
    -- 'lua vim.lsp.buf.formatting()',
    {}
)

