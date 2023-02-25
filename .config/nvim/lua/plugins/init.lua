-- require 'plugins.installed-plugins'
require 'plugins.treesitter-config'
require 'plugins.tree-config'
require 'plugins.lsp-config'
require 'plugins.notify-config'
require 'plugins.lualine-config'
require 'plugins.barbar-config'
require 'plugins.gitsigns-config'
require 'plugins.hop-config'
require 'plugins.indentblankline-config'
require 'plugins.cursorholdfix'
require 'plugins.whichkey-config'
require 'plugins.emmet-vim'
-- require 'plugins.prettyfold-config'

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    print('Something went wrong with packer')
    return
end


packer.init {
    display = {
        open_fn = function()
            return require 'packer.util'.float { border = 'rounded' }
        end,
    },
}

packer.startup(function()
    use 'wbthomason/packer.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }
    use 'lukas-reineke/indent-blankline.nvim'
    use 'p00f/nvim-ts-rainbow'

    use 'nvim-lua/plenary.nvim' -- Used by others
    use 'kyazdani42/nvim-web-devicons' -- icons for tree
    use {
        'kyazdani42/nvim-tree.lua',
        -- commit = 'c66cbdfc25ce115db50cfe3dca8b96a8a1e9b931',
    }
    use 'rcarriga/nvim-notify'

    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'tpope/vim-commentary'
    use 'nvim-lualine/lualine.nvim'
    use 'romgrk/barbar.nvim'
    -- Colorscheme
    use 'overcache/NeoSolarized'
    use 'EdenEast/nightfox.nvim'
    use 'bluz71/vim-nightfly-guicolors'
    use 'folke/tokyonight.nvim'

    -- LSP support
    use {
        'neovim/nvim-lspconfig',
        "williamboman/nvim-lsp-installer",
    }
    -- use 'anuvyklack/pretty-fold.nvim'
    -- CMP support
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lua'
    -- Snippets
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'mattn/emmet-vim'
    use 'AndrewRadev/tagalong.vim'

    -- Git support
    use 'lewis6991/gitsigns.nvim'

    use 'jiangmiao/auto-pairs'

    -- Telescope
    use 'nvim-lua/plenary.nvim'
    -- use 'BurntSushi/ripgrep'
    use 'sharkdp/fd'
    use 'nvim-telescope/telescope.nvim'

    -- jump word
    use 'phaazon/hop.nvim'

    -- key display
    use 'folke/which-key.nvim'

    -- fix for CursorHold
    use 'antoinemadec/FixCursorHold.nvim'
end)
