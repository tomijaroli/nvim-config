local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end

local typescript_status, typescript = pcall(require, "typescript")
if not typescript_status then
    return
end

local keymap = vim.keymap.set

local on_attach = function(client, bufnr)
    local opts = {
        noremap = true,
        silent = true,
        buffer = bufnr,
    }

    -- set keybinds
    keymap("n", "gF", "<cmd>Lspsaga lsp_finder<CR>", opts)
    keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
    keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
    keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
    keymap("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    keymap("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
    keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
    keymap("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)

    if client.name == "tsserver" then
        keymap("n", "<leader>rf", ":TypescriptRenameFile<CR>")
    end
end

-- used to enable autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["html"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

typescript.setup {
    server = {
        capabilities = capabilities,
        on_attach = on_attach,
    },
}

lspconfig["cssls"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lspconfig["sumneko_lua"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.stdpath "config" .. "/lua"] = true,
                },
            },
        },
    },
}
