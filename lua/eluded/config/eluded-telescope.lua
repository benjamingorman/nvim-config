local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>p', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
--vim.keymap.set('n', '<leader>fe', ":Telescope file_browser<CR>")
vim.keymap.set("n", "<leader>fe", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
vim.keymap.set("n", "<leader>fr", ":Telescope frecency workspace=CWD<CR>")
vim.keymap.set("n", "<leader>fs", ":Telescope luasnip<CR>")

-- require 'telescope'.load_extension('project')
require('telescope').setup {
  defaults = {
  },
  pickers = {
    find_files = {
      search_dirs = { ".", "~/.config/nvim" }
    },
    live_grep = {
      search_dirs = { ".", "~/.config/nvim" }
    },
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    }
  }
}
-- require('telescope').load_extension('luasnip')
