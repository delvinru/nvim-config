vim.cmd.colorscheme("onedark")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg= "none" })

-- Consider all .yar/.yara files to be YARA files.
vim.cmd [[
    autocmd BufNewFile,BufRead *.yar,*.yara setlocal filetype=yara"
]]
