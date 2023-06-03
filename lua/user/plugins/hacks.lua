-- Some dirty tricks for vim

local cmd = vim.cmd

-- Don't auto comment new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

cmd [[
    augroup yaml_fix
        autocmd!
        autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
    augroup END
]]
