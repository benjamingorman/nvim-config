local highlight = {
  "RainbowBlack",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#118F5F" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
  vim.api.nvim_set_hl(0, "RainbowBlack", { fg = "#2F2F38" })
end)
require("ibl").setup {
  indent = { highlight = highlight, char = "┊" },
  scope = { highlight = "RainbowYellow" },
}
