return {
    -- color themes
    "sainnhe/everforest",
    "sainnhe/gruvbox-material",
    "folke/tokyonight.nvim",
    "cocopon/iceberg.vim",
    "bluz71/vim-nightfly-colors",
    "EdenEast/nightfox.nvim",
    "arcticicestudio/nord-vim",
    "jacoborus/tender.vim",
    -- cmp
    "hrsh7th/nvim-cmp", -- completion
    "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim's built-in LSP
    "hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words
    "hrsh7th/cmp-path",
    "onsails/lspkind.nvim", -- icons and pictograms for completion window
    -- snippets
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    {
        "glepnir/lspsaga.nvim",
        branch = "main",
    },
    "jose-elias-alvarez/typescript.nvim",
    -- mason language server manager
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- formatter
    "jose-elias-alvarez/null-ls.nvim",
    "jayp0521/mason-null-ls.nvim",
    -- misc
    "nvim-lualine/lualine.nvim",
    "christoomey/vim-tmux-navigator",
    "szw/vim-maximizer",
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
    },
    "neovim/nvim-lspconfig",
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            local ts_update = require("nvim-treesitter.install").update {
                with_sync = true,
            }
            ts_update()
        end,
    },
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
}
