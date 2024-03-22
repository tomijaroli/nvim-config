local opts = { noremap = true }

local keymap = vim.keymap.set

-- Clear highlight on pressing <Esc> in normal mode
keymap("n", "<Esc>", ":nohl<CR>", { desc = "Clear highlights", silent = true })

-- Diagnostics keymaps
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
keymap("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
keymap("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Disable arrow keys in normal mode
keymap("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
keymap("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
keymap("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
keymap("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Move focus to the left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move focus to the right window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move focus to the lower window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move focus to the upper window" })

-- Tabs
keymap("n", "<leader>to", ":tabnew<CR>", { silent = true, desc = "Open new tab" })
keymap("n", "<leader>tx", ":tabclose<CR>", { silent = true, desc = "Close current tab" })
keymap("n", "<leader>tn", "<Cmd>BufferLineCycleNext<CR>", { desc = "Go to next tab" })
keymap("n", "<leader>tp", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Go to previous tab" })

keymap("n", "x", '"_x')
keymap("n", "gG", "gg<S-v>G", { desc = "Select all" })

-- Editing
keymap("n", "<leader>wt", ":set wrap!<CR>", { desc = "Toggle word wrapping" })

keymap("i", "jk", "<ESC>") -- quick exit to normal mode

-- vim-maximizer
keymap("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "Zoom to current window" })

-- WhichKey
keymap("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>", opts)
