local status_saga, saga = pcall(require, "lspsaga")
if not status_saga then
    print("failed to load: status_saga")
    return
end

saga.setup({
    move_in_saga = {
        prev = "<C-k>",
        next = "<C-j>"
    },
    finder_action_keys = {
        open = "<CR>",
    },
    definition_action_keys = {
        edit = "<CR>",
    }
})
