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
keymap("n", "<leader>to", ":tabnew<CR>", { silent = true, desc = "Open new tab" })
keymap("n", "<leader>tx", ":tabclose<CR>", { silent = true, desc = "Close current tab" })
keymap("n", "<leader>tn", "<Cmd>BufferLineCycleNext<CR>", { desc = "Go to next tab" })
keymap("n", "<leader>tp", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Go to previous tab" })

-- General keymaps
keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Clear highlights" })

keymap("n", "x", '"_x')
keymap("n", "gG", "gg<S-v>G", { desc = "Select all" })

-- Window management
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Make split windows equal width" })
keymap("n", "<leader>sx", ":close<CR>", { desc = "Close current split window" })

-- Editing
keymap("n", "<leader>wt", ":set wrap!<CR>", { desc = "Toggle word wrapping" })

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
keymap("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "Zoom to current window" })

-- WhichKey
keymap("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>", opts)
