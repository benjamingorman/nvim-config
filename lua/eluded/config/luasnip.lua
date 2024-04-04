-- set keybinds for both INSERT and VISUAL.
local keymap = vim.api.nvim_set_keymap
keymap("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", {})
keymap("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", {})
keymap("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", {})
keymap("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", {})
