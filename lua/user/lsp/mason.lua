local status_mason, mason = pcall(require, "mason")
if not status_mason then
    print("failed to load: mason")
    return
end

local status_mason_config, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_mason_config then
    print("failed to load: mason-lspconfig")
end

local status_mason_null_ls, mason_null_ls = pcall(require, "mason-null-ls")
if not status_mason_null_ls then
    print("failed to load: mason-null-ls")
    return
end

mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
        "lua_ls",
        "pyright",
    }
})

mason_null_ls.setup({
    ensure_installed = {
        "isort",
        "black"
    }
})
