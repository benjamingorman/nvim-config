-- Define commands for Lua compatible with Neovim
vim.cmd [[
  command! Econf lua require('eluded.utils').edit_config()
  command! Eplug lua require('eluded.utils').edit_plugins()
  command! Ezsh lua require('eluded.utils').edit_zshrc()
  command! Etmux lua require('eluded.utils').edit_tmux()
  command! Essh lua require('eluded.utils').edit_ssh()
]]
