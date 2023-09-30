local status_null, null_ls = pcall(require, "null-ls")
if not status_null then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/prettier-solidity/prettier-plugin-solidity
-- npm install --save-dev prettier prettier-plugin-solidity
null_ls.setup({
    debug = false,
    sources = {
        formatting.isort.with({
            extra_args = { "--python-version", "311" }
        }),
        formatting.black.with({
            extra_args = { "-t", "py311" }
        })
    },
})
