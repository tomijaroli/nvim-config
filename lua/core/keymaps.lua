local opts = { noremap = true }

local keymap = vim.keymap.set

-----------------------------------
-- Remap <leader> key to <Space> --
-----------------------------------

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-i>", "<C-i>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-----------------
-- Normal mode --
-----------------

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Tabs
keymap("n", "<leader>to", ":tabnew<CR>", { silent = true }) -- open new tab
keymap("n", "<leader>tx", ":tabclose<CR>", { silent = true }) -- close current tab
keymap("n", "<leader>tn", "<Cmd>BufferLineCycleNext<CR>", {}) -- go to next tab
keymap("n", "<leader>tp", "<Cmd>BufferLineCyclePrev<CR>", {}) -- go to previous tab

-- General keymaps
keymap("n", "<leader>nh", ":nohl<CR>") -- clear highlights

keymap("n", "x", '"_x')
keymap("n", "<C-a>", "gg<S-v>G") -- select all

-- Window management
keymap("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap("n", "<leader>sx", ":close<CR>") -- close current split window

-----------------
-- Insert mode --
-----------------

keymap("i", "jk", "<ESC>") -- quick exit to normal mode

--------------------
-- Plugin keymaps
--------------------

-- Alpha
-- keymap("n", "<RightMouse>", ":Alpha<CR>", opts)

-- vim-maximizer
keymap("n", "<leader>sm", ":MaximizerToggle<CR>")

-- WhichKey
keymap("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>", opts)
