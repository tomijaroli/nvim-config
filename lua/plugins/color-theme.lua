return {
    "catppuccin/nvim",
    version = "v1.6.0",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
        vim.cmd.colorscheme "catppuccin-macchiato"
        vim.cmd.hi "Comment gui=none"
    end,
}

-- Other themes:

-- "sainnhe/everforest",
-- "sainnhe/gruvbox-material",
-- "folke/tokyonight.nvim",
-- "cocopon/iceberg.vim",
-- "bluz71/vim-nightfly-colors",
-- "EdenEast/nightfox.nvim",
-- "arcticicestudio/nord-vim",
-- "jacoborus/tender.vim",
