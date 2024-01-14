return {
    "dinhhuy258/git.nvim",
    config = function()
        local git = require "git"
        git.setup {
            keymaps = {
                blame = "<leader>gB",
                browse = "<leader>go",
            },
        }
    end,
}
