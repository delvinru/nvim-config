local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    print("failed to load: nvim-tree")
    return
end

-- recommended settings from docs
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            }
        }
    }
})
