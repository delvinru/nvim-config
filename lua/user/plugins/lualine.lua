local status, lualine = pcall(require, 'lualine')
if not status then
    print("failed to load: lualine")
    return
end

local function parse_codestats()
    return vim.fn.CodeStatsXp()
end

local function parse_lsp_name()
    local msg = "No LSP"
    local buf_filetype = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return msg
    end
    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_filetype) ~= 1 then
            return client.name
        end
    end
    return msg
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
            {
                'filename',
                path = 1
            }
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype', parse_lsp_name, parse_codestats },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
})
