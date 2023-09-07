-- bootstraping lazyvim as a package manager

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
    print('Something went wrong with lazy')
    return
end

lazy.setup ({
    {
        'nvim-treesitter/nvim-treesitter',
        cmd = 'TSUpdate',
        commit = '99eef501a3d9128c15440296850b5bb178d6d560',
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        commit = '9637670896b68805430e2f72cf5d16be5b97a22a',
    },
    {
        'p00f/nvim-ts-rainbow', -- Unmaintened
    },

    {
        'nvim-lua/plenary.nvim',
        commit = '267282a9ce242bbb0c5dc31445b6d353bed978bb'
    }, -- Used by others
    {
        'nvim-tree/nvim-web-devicons',
        commit = 'cfc8824cc1db316a276b36517f093baccb8e799a', -- icons for tree
    },
    {
        -- FILE EXPLORER
        'nvim-tree/nvim-tree.lua',
        commit = '920868dba13466586897a8f40220eca6b2caac41',
    },
    {
        'rcarriga/nvim-notify',
        commit = 'ea9c8ce7a37f2238f934e087c255758659948e0f',
    },

    {
        'JoosepAlviste/nvim-ts-context-commentstring',
        commit = '9bff161dfece6ecf3459e6e46ca42e49f9ed939f',
    },
    {
        'tpope/vim-commentary',
        commit = 'e87cd90dc09c2a203e13af9704bd0ef79303d755',
        -- autocmd FileType apache setlocal commentstring=#\ %s to enabled comment on unsupported file type
    },
    {
        'nvim-lualine/lualine.nvim',
        commit = '45e27ca739c7be6c49e5496d14fcf45a303c3a63',
    },
    {
        'romgrk/barbar.nvim',
        commit = 'dd852401ee902745b67fc09a83d113b3fe82a96f',
    },

    -- Colorscheme
    'overcache/NeoSolarized',
    'EdenEast/nightfox.nvim',
    'bluz71/vim-nightfly-guicolors',
    'folke/tokyonight.nvim',

    -- LSP support
    {
        'neovim/nvim-lspconfig',
        commit = 'f7922e59aeb9bc3e31a660ea4e7405ffa3fc2c3a',
    },
    {
        'williamboman/mason.nvim',
        commit = 'a51c2d063c5377ee9e58c5f9cda7c7436787be72',
        cmd = "MasonUpdate",
    },
    {
        'williamboman/mason-lspconfig.nvim',
        commit = '2997f467881ac4faa6f8c5e7065e3a672297c8ad',
    },
    -- CMP support
    {
        'hrsh7th/cmp-nvim-lsp',
        commit = '44b16d11215dce86f253ce0c30949813c0a90765',
    },
    {
        'hrsh7th/cmp-buffer',
        commit = '3022dbc9166796b644a841a02de8dd1cc1d311fa',
    },
    {
        'hrsh7th/cmp-path',
        commit = '91ff86cd9c29299a64f968ebb45846c485725f23',
    },
    {
        'hrsh7th/cmp-cmdline',
        commit = '8ee981b4a91f536f52add291594e89fb6645e451',
    },
    {
        'hrsh7th/nvim-cmp',
        commit = '51f1e11a89ec701221877532ee1a23557d291dd5',
    },
    {
        'hrsh7th/cmp-nvim-lua',
        commit = 'f12408bdb54c39c23e67cab726264c10db33ada8',
    },
    -- Snippets
    {
        'L3MON4D3/LuaSnip', -- Snippets plugin
        commit = 'c4d6298347f7707e9757351b2ee03d0c00da5c20',
    },
    {
        'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
        commit = '18095520391186d634a0045dacaa346291096566',
    },
    {
        'mattn/emmet-vim',
        commit = 'def5d57a1ae5afb1b96ebe83c4652d1c03640f4d',

    },
    {
        'AndrewRadev/tagalong.vim',
        commit = 'd12622b866c9eea5204a792517d11586c51715a2',
    },

    -- Git support
    {
        'lewis6991/gitsigns.nvim',
        commit = '749267aaa863c30d721c9913699c5d94e0c07dd3',
    },

    {
        'jiangmiao/auto-pairs',
        commit = '39f06b873a8449af8ff6a3eee716d3da14d63a76',
    },

    -- Telescope
    {
        'sharkdp/fd',
        commit = 'a248607beefac2137cbe068ef74898c46e0705dd',
    },
    {
        'nvim-telescope/telescope.nvim',
        commit = '2d92125620417fbea82ec30303823e3cd69e90e8',
    },

    -- jump word
    {
        'phaazon/hop.nvim',
        commit = '03f0434869f1f38868618198b5f4f2ab6d39aef2',
    },

    -- key display
    {
        'folke/which-key.nvim',
        commit = '7ccf476ebe0445a741b64e36c78a682c1c6118b7',
    },

    -- AI support
    {
        'dense-analysis/neural',
        commit = '7ba4b061ef7b5e30a1463148b3370b9bab8ecf0d',
    },
    -- Dependencies :
    {
        'MunifTanjim/nui.nvim',
        commit = '9e3916e784660f55f47daa6f26053ad044db5d6a',
    },
    {
        'ElPiloto/significant.nvim',
        commit = '5450e9d5917dc6aa9afb0fcbe32355799b8303fb',
    },
    {
        'dense-analysis/ale',
        commit = '115ad17ace047cab20ccc67f79c943aaf3f0f291',
    },

})

require 'plugins.neural-config'
require 'plugins.treesitter-config'
require 'plugins.tree-config'
require 'plugins.lsp-config'
require 'plugins.notify-config'
require 'plugins.lualine-config'
require 'plugins.barbar-config'
require 'plugins.gitsigns-config'
require 'plugins.hop-config'
require 'plugins.indentblankline-config'
require 'plugins.whichkey-config'
require 'plugins.emmet-vim'
require 'plugins.nvim_cmp-config'
