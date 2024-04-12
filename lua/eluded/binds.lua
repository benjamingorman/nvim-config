local keymap = vim.keymap
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>q", ":q<CR>")

-- system clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

-- Format current buffer
keymap.set("n", "<leader>lf", vim.lsp.buf.format)

-- Mouse side buttons back/forward
keymap.set("n", "-", ":BufferHistoryBack<CR>")
keymap.set("n", "=", ":BufferHistoryForward<CR>")
