vim.cmd [[
    colorscheme onedark
    set background=dark
    hi Normal guibg=NONE ctermbg=NONE
]]

-- Consider all .yar/.yara files to be YARA files.
vim.cmd [[
    autocmd BufNewFile,BufRead *.yar,*.yara setlocal filetype=yara"
]]
