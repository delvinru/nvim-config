local status_lspconfig, lspconfig = pcall(require, "lspconfig")
if not status_lspconfig then
    print("failed to tinit: lspconfig")
    return
end

local status_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_nvim_lsp then
    print("failed to init: cmp_nvim_lsp")
    return
end

local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = true, silent = true }
    local keymap = vim.keymap.set

    keymap("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
    keymap("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    keymap("n", "gd", "<cmd>Lspsaga goto_type_definition<CR>", opts)
    keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
    keymap("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    keymap("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
    keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    "vim"
                }
            }
        }
    }
})

lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {
        "python"
    }
})
