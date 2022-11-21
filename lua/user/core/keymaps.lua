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
keymap("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- General keymaps
keymap("n", "<leader>nh", ":nohl<CR>") -- clear highlights

keymap("n", "x", '"_x')

-- Window management
keymap("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap("n", "<leader>sx", ":close<CR>") -- close current split window

-- Move text up and down
-- keymap("n", "C-S-j", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "C-S-k", "<Esc>:m .-2<CR>==gi", opts)

-----------------
-- Insert mode --
-----------------

keymap("i", "jk", "<ESC>") -- quick exit to normal mode

--------------------
-- Plugin keymaps
--------------------

-- Alpha
-- keymap("n", "<RightMouse>", ":Alpha<CR>", opts)

-- nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>")

-- vim-maximizer
keymap("n", "<leader>sm", ":MaximizerToggle<CR>")

-- telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap("n", "<leader>fs", "<cmd>Telescope live_grep<CR>")
keymap("n", "<leader>fc", "<cmd>Telescope grep_string<CR>")
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")

-- WhichKey
keymap("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>", opts)
