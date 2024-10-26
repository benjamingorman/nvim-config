-- Define utility functions for editing specific files
local M = {}

function M.is_windows()
  return vim.fn.has('win32') == 1
end

local NVIM_PATH = vim.fn.stdpath('config')

function M.edit_config()
  vim.cmd(string.format("edit %s/%s", NVIM_PATH, "init.lua"))
end

function M.edit_plugins()
  vim.cmd(string.format("edit %s/%s", NVIM_PATH, "lua/eluded/plugins.lua"))
end

function M.edit_zshrc()
  vim.cmd(string.format("edit %s", "~/.zshrc"))
end

function M.edit_tmux()
  vim.cmd(string.format("edit %s", "~/.tmux.conf"))
end

function M.edit_ssh()
  vim.cmd(string.format("sp %s", "~/.ssh/config"))
end

function M.edit_todo()
  vim.cmd(string.format("sp %s", "TODO.md"))
end

function M.edit_readme()
  vim.cmd(string.format("sp %s", "README.md"))
end

return M
