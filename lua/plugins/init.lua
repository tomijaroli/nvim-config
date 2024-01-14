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
    -- misc
    "christoomey/vim-tmux-navigator",
    "szw/vim-maximizer",
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
