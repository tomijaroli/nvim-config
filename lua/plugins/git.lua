return {
    "dinhhuy258/git.nvim",
    commit = "6b4a66f8a66e567bf27a0ef1de72cf5e338df4c3",
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
