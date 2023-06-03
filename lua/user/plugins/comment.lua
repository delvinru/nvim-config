local status, comment = pcall(require, "Comment")
if not status then
    print("failed to load: Comment")
    return
end

comment.setup()
