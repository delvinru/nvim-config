-- Some dirty tricks for vim

vim.cmd [[
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=0
]]

vim.cmd [[
    augroup yaml_fix
        autocmd!
        autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
    augroup END
]]
