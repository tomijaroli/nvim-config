vim.api.nvim_create_autocmd("FileType", {
    pattern = "oil",
    callback = function()
        vim.opt_local.colorcolumn = ""
    end,
})

return {
    "stevearc/oil.nvim",
    version = "v2.7.0",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        commit = "cb0c967c9723a76ccb1be0cc3a9a10e577d2f6ec",
    },
    opts = {},
    config = function()
        local oil = require "oil"
        oil.setup {
            view_options = {
                show_hidden = true,
            },
        }
        vim.keymap.set("n", "-", oil.open_float, { desc = "Open parent directory" })
    end,
}
