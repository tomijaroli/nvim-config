require "core.globals"
require "core.options"
require "core.keymaps"

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

-- Load lazy --
local status, lazy = pcall(require, "lazy")
if not status then
    return
end

lazy.setup "plugin"
