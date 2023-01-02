local fn = vim.fn

-- Install packer automatically --
local ensure_packer = function()
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Automatically source plugins-setup file and reload vim on save --
vim.cmd [[ 
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    augroup end
]]

-- Load packer --
local status, packer = pcall(require, "packer")
if not status then
    return
end

-- Display packer sync window in a floating box --
packer.init {
    snapshot_path = fn.stdpath "config" .. "/snapshots",
    max_jobs = 50,
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
        prompt_border = "rounded",
    },
}

-- Install plugins --
return packer.startup(function(use)
    use "wbthomason/packer.nvim"

    -- lua functions that many plugins use
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"

    -------------------
    -- COLOR SCHEMES --
    -------------------

    -- gruvbox colorscheme
    use "sainnhe/gruvbox-material"

    -- Onedark colorscheme
    use "navarasu/onedark.nvim"

    -- Onedarker colorscheme
    use "LunarVim/onedarker.nvim"

    -- tokyonight coloscheme
    use "folke/tokyonight.nvim"

    -- One monokai colorscheme
    use "fratajczak/one-monokai-vim"

    -- nightfly colorscheme
    use "bluz71/vim-nightfly-colors"

    -- nightfox colorscheme
    use "EdenEast/nightfox.nvim"

    -- papercolor colorscheme
    use "NLKNguyen/papercolor-theme"

    -- -- nord colorscheme by shaunsingh
    -- use "shaunsingh/nord.nvim"
    use "arcticicestudio/nord-vim"

    -- neosolarized colorscheme
    use {
        "svrana/neosolarized.nvim",
        requires = { "tjdevries/colorbuddy.nvim" },
    }

    -- tender colorscheme
    use "jacoborus/tender.vim"

    -- iceberg colorscheme
    use "cocopon/iceberg.vim"

    -- everforest colorscheme
    use "sainnhe/everforest"

    -- icons
    use "kyazdani42/nvim-web-devicons"

    -- statusline
    use "nvim-lualine/lualine.nvim"

    -- color highlighting for hex codes
    use "norcalli/nvim-colorizer.lua"

    -- tmux & split window navigation
    use "christoomey/vim-tmux-navigator"

    -- maximizes and restores current window
    use "szw/vim-maximizer"

    -- essential plugins
    use "tpope/vim-surround"
    use "vim-scripts/ReplaceWithRegister"

    -- commenting with gc
    use "numToStr/Comment.nvim"

    -- file explorer
    use "nvim-tree/nvim-tree.lua"

    -- fuzzy finding
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
    }
    use {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
    }

    ---------
    -- LSP --
    ---------

    -- configuring lsp servers
    use "neovim/nvim-lspconfig" -- LSP

    -- auto completion
    use "hrsh7th/nvim-cmp" -- completion
    use "hrsh7th/cmp-nvim-lsp" -- nvim-cmp source for neovim's built-in LSP
    use "hrsh7th/cmp-buffer" -- nvim-cmp source for buffer words
    use "hrsh7th/cmp-path"
    use "onsails/lspkind.nvim" -- icons and pictograms for completion window

    -- snippets
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"

    use {
        "glepnir/lspsaga.nvim",
        branch = "main",
    }
    use "jose-elias-alvarez/typescript.nvim"

    -- managing & installing lsp servers
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"

    -- formatting & linting
    use "jose-elias-alvarez/null-ls.nvim"
    use "jayp0521/mason-null-ls.nvim"

    -- treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update {
                with_sync = true,
            }
            ts_update()
        end,
    }

    -- auto closing
    use "windwp/nvim-autopairs"
    use "windwp/nvim-ts-autotag"

    -- bufferline for tabs
    use "akinsho/bufferline.nvim"

    -- git signs plugin
    use "lewis6991/gitsigns.nvim"
    use "dinhhuy258/git.nvim"

    -- install markdown-preview
    use {
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    }

    -- which key panel that shows shortcuts
    use "folke/which-key.nvim"

    -- dap - debugger adapter protocol
    -- see https://github.com/mfussenegger/nvim-dap for documentation and settings
    -- https://github.com/rcarriga/nvim-dap-ui
    -- https://github.com/Pocco81/dap-buddy.nvim
    -- use "mfussenegger/nvim-dap"
    -- use "rcarriga/nvim-dap-ui"

    -- indent lines
    use "lukas-reineke/indent-blankline.nvim"

    if packer_bootstrap then
        require("packer").sync()
    end
end)
