return {
    -- snippets
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
