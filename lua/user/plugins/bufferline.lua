local status_bufferline, bufferline = pcall(require, "bufferline")
if not status_bufferline then
    return
end

bufferline.setup({
    options = {
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    }
})
