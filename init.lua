require('eluded.set')
require('eluded.binds')
require('eluded.plugins')

require('eluded.config.lsp')

vim.cmd("colorscheme kanagawa-wave")

local timer = vim.loop.new_timer()
timer:start(100, 0, function()
  vim.notify("Welcome to neovim", vim.log.levels.INFO,
    { title = "Eluded", timeout = 1000 }
  )
end)