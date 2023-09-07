local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    print('Something went wrong with packer')
    return
end


packer.init { -- Unmaintened
    display = {
        open_fn = function()
            return require 'packer.util'.float { border = 'rounded' }
        end,
    },
}

packer.startup(function()
    use {
        'wbthomason/packer.nvim',
        commit = '90f794d01dd5f50404f8ef6e1d22377ba5180787',
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        commit = '99eef501a3d9128c15440296850b5bb178d6d560',
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        commit = '9637670896b68805430e2f72cf5d16be5b97a22a',
    }
    use {
        'p00f/nvim-ts-rainbow', -- Unmaintened
    }

    use {
        'nvim-lua/plenary.nvim',
        commit = '267282a9ce242bbb0c5dc31445b6d353bed978bb'
    } -- Used by others
    use {
        'nvim-tree/nvim-web-devicons',
        commit = 'cfc8824cc1db316a276b36517f093baccb8e799a', -- icons for tree
    }
    use {
        -- FILE EXPLORER
        'nvim-tree/nvim-tree.lua',
        commit = '920868dba13466586897a8f40220eca6b2caac41',
    }
    use {
        'rcarriga/nvim-notify',
        commit = 'ea9c8ce7a37f2238f934e087c255758659948e0f',
    }

    use {
        'JoosepAlviste/nvim-ts-context-commentstring',
        commit = '9bff161dfece6ecf3459e6e46ca42e49f9ed939f',
    }
    use {
        'tpope/vim-commentary',
        commit = 'e87cd90dc09c2a203e13af9704bd0ef79303d755',
        -- autocmd FileType apache setlocal commentstring=#\ %s to enabled comment on unsupported file type
    }
    use {
        'nvim-lualine/lualine.nvim',
        commit = '45e27ca739c7be6c49e5496d14fcf45a303c3a63',
    }
    use {
        'romgrk/barbar.nvim',
        commit = 'dd852401ee902745b67fc09a83d113b3fe82a96f',
    }

    -- Colorscheme
    use 'overcache/NeoSolarized'
    use 'EdenEast/nightfox.nvim'
    use 'bluz71/vim-nightfly-guicolors'
    use 'folke/tokyonight.nvim'

    -- LSP support
    use {
        'neovim/nvim-lspconfig',
        commit = 'f7922e59aeb9bc3e31a660ea4e7405ffa3fc2c3a',
    }
    use {
        'williamboman/mason.nvim',
        commit = 'a51c2d063c5377ee9e58c5f9cda7c7436787be72',
        run = ":MasonUpdate",
    }
    use {
        'williamboman/mason-lspconfig.nvim',
        commit = '2997f467881ac4faa6f8c5e7065e3a672297c8ad',
    }
    -- CMP support
    use {
        'hrsh7th/cmp-nvim-lsp',
        commit = '44b16d11215dce86f253ce0c30949813c0a90765',
    }
    use {
        'hrsh7th/cmp-buffer',
        commit = '3022dbc9166796b644a841a02de8dd1cc1d311fa',
    }
    use {
        'hrsh7th/cmp-path',
        commit = '91ff86cd9c29299a64f968ebb45846c485725f23',
    }
    use {
        'hrsh7th/cmp-cmdline',
        commit = '8ee981b4a91f536f52add291594e89fb6645e451',
    }
    use {
        'hrsh7th/nvim-cmp',
        commit = '51f1e11a89ec701221877532ee1a23557d291dd5',
    }
    use {
        'hrsh7th/cmp-nvim-lua',
        commit = 'f12408bdb54c39c23e67cab726264c10db33ada8',
    }
    -- Snippets
    use {
        'L3MON4D3/LuaSnip', -- Snippets plugin
        commit = 'c4d6298347f7707e9757351b2ee03d0c00da5c20',
    }
    use {
        'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
        commit = '18095520391186d634a0045dacaa346291096566',
    }
    use {
        'mattn/emmet-vim',
        commit = 'def5d57a1ae5afb1b96ebe83c4652d1c03640f4d',

    }
    use {
        'AndrewRadev/tagalong.vim',
        commit = 'd12622b866c9eea5204a792517d11586c51715a2',
    }

    -- Git support
    use {
        'lewis6991/gitsigns.nvim',
        commit = '749267aaa863c30d721c9913699c5d94e0c07dd3',
    }

    use {
        'jiangmiao/auto-pairs',
        commit = '39f06b873a8449af8ff6a3eee716d3da14d63a76',
    }

    -- Telescope
    use {
        'sharkdp/fd',
        commit = 'a248607beefac2137cbe068ef74898c46e0705dd',
    }
    use {
        'nvim-telescope/telescope.nvim',
        commit = '2d92125620417fbea82ec30303823e3cd69e90e8',
    }

    -- jump word
    use {
        'phaazon/hop.nvim',
        commit = '03f0434869f1f38868618198b5f4f2ab6d39aef2',
    }

    -- key display
    use {
        'folke/which-key.nvim',
        commit = '7ccf476ebe0445a741b64e36c78a682c1c6118b7',
    }

    -- AI support
    use {
        'dense-analysis/neural',
        commit = '7ba4b061ef7b5e30a1463148b3370b9bab8ecf0d',
    }
    -- Dependencies :
    use {
        'MunifTanjim/nui.nvim',
        commit = '9e3916e784660f55f47daa6f26053ad044db5d6a',
    }
    use {
        'ElPiloto/significant.nvim',
        commit = '5450e9d5917dc6aa9afb0fcbe32355799b8303fb',
    }
    use {
        'dense-analysis/ale',
        commit = '115ad17ace047cab20ccc67f79c943aaf3f0f291',
    }
end)

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
