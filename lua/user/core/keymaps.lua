vim.g.mapleader = " "

local keymap = vim.keymap.set

-- general keymaps

keymap("i", "jk", "<ESC>")

keymap("n", "<leader>nh", ":nohl<CR>")

keymap("n", "x", '"_x')

keymap("n", "<leader>+", "<C-a>")
keymap("n", "<leader>-", "<C-x>")

keymap("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap("n", "<leader>sx", ":close<CR>") -- close current split window

keymap("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- plugin keymaps

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
