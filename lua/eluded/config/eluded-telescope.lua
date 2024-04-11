local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>p', builtin.git_files, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
--vim.keymap.set('n', '<leader>fe', ":Telescope file_browser<CR>")
vim.keymap.set("n", "<leader>fe", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
vim.keymap.set("n", "<leader>fr", ":Telescope frecency workspace=CWD<CR>")
vim.keymap.set("n", "<leader>fs", ":Telescope luasnip<CR>")
vim.keymap.set("n", "<leader>fp", ":lua require'telescope'.extensions.project.project{}<CR>")

local project_actions = require("telescope._extensions.project.actions")
require('telescope').setup {
  defaults = {
    mappings = {
      n = {
        ["s"] = "select_vertical",
        ["i"] = "select_horizontal"
      }
    }
  },
  pickers = {
    find_files = {
      search_dirs = { ".", vim.fn.stdpath('config') }
    },
    live_grep = {
      search_dirs = { ".", vim.fn.stdpath('config') }
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
    },
    project = {
      base_dirs = { "~/Projects", "~/AppData/Local/nvim/" },
      sync_with_nvim_tree = true,
      on_project_selected = function(prompt_bufnr)
        -- Do anything you want in here. For example:
        project_actions.change_working_directory(prompt_bufnr, false)
        -- require("harpoon.ui").nav_file(1)
        -- vim.notify("Project selected " .. prompt_bufnr)
      end
    },
  }
}
-- require('telescope').load_extension('luasnip')
