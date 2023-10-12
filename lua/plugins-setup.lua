local util_functions = {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
}

local color_schemes = {
    "catppuccin/nvim",
    "sainnhe/everforest",
    "sainnhe/gruvbox-material",
    "folke/tokyonight.nvim",
    "cocopon/iceberg.vim",
    "bluz71/vim-nightfly-colors",
    "EdenEast/nightfox.nvim",
    "arcticicestudio/nord-vim",
    "jacoborus/tender.vim",
}

local auto_completion = {
    "hrsh7th/nvim-cmp", -- completion
    "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim's built-in LSP
    "hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words
    "hrsh7th/cmp-path",
    "onsails/lspkind.nvim", -- icons and pictograms for completion window
}

local snippets = {
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    {
        "glepnir/lspsaga.nvim",
        branch = "main",
    },
    "jose-elias-alvarez/typescript.nvim",
}

local lsp_servers = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
}

local formatters = {
    "jose-elias-alvarez/null-ls.nvim",
    "jayp0521/mason-null-ls.nvim",
}

local plugins = {
    util_functions,
    color_schemes,
    "folke/todo-comments.nvim",
    "kyazdani42/nvim-web-devicons",
    "nvim-lualine/lualine.nvim",
    "norcalli/nvim-colorizer.lua",
    "christoomey/vim-tmux-navigator",
    "szw/vim-maximizer",
    "tpope/vim-surround",
    "vim-scripts/ReplaceWithRegister",
    "numToStr/Comment.nvim",
    "nvim-tree/nvim-tree.lua",
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
    },
    "neovim/nvim-lspconfig",
    auto_completion,
    snippets,
    lsp_servers,
    formatters,
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            local ts_update = require("nvim-treesitter.install").update {
                with_sync = true,
            }
            ts_update()
        end,
    },
    "windwp/nvim-autopairs",
    "windwp/nvim-ts-autotag",
    "akinsho/bufferline.nvim",
    "lewis6991/gitsigns.nvim",
    "dinhhuy258/git.nvim",
    {
        "iamcco/markdown-preview.nvim",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
    "folke/which-key.nvim",
    "lukas-reineke/indent-blankline.nvim",
}

lazy.setup(plugins)
