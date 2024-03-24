return {
    "catppuccin/nvim",
    version = "v1.6.0",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    opts = {
        transparent_background = true,
        styles = {
            sidebars = "transparent",
            floats = "transparent",
        },
        integrations = {
            cmp = true,
            gitsigns = true,
            indent_blankline = {
                enabled = false,
                scope_color = "sapphire",
                colored_indent_levels = false,
            },
            mason = true,
            native_lsp = { enabled = true },
            notify = true,
            neotree = true,
            symbols_outline = true,
            telescope = true,
            treesitter = true,
            treesitter_context = true,
        },
    },
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme "catppuccin-macchiato"
        vim.cmd.hi "Comment gui=none"
    end,
}

-- Some nice themes:

-- "catppuccin/nvim",
-- "sainnhe/everforest",
-- "sainnhe/gruvbox-material",
-- "folke/tokyonight.nvim",
-- "cocopon/iceberg.vim",
-- "bluz71/vim-nightfly-colors",
-- "EdenEast/nightfox.nvim",
-- "arcticicestudio/nord-vim",
-- "jacoborus/tender.vim",
