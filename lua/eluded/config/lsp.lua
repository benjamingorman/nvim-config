local lsp_zero = require('lsp-zero')

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  -- https://lsp-zero.netlify.app/v3.x/language-server-configuration.html
  lsp_zero.default_keymaps({ buffer = bufnr })
  vim.api.nvim_set_keymap('n', 'g.', '<cmd>lua vim.lsp.buf.code_action()<CR>', {})

  -- Auto format on save
  -- if client.supports_method("textDocument/formatting") then
  --   vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  --   vim.api.nvim_create_autocmd("BufWritePre", {
  --     group = augroup,
  --     buffer = bufnr,
  --     callback = function()
  --       vim.lsp.buf.format()
  --     end,
  --   })
  -- end
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'tsserver', 'rust_analyzer', 'lua_ls', 'pyright' },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

-- local lspconfig = require('lspconfig')
-- local lspcontainers = require('lspcontainers')

-- lspconfig.pyright.setup {
--   cmd = lspcontainers.command('pyright', {
--     image = "lspcontainers/pyright-langserver:1.1.137",
--   }),
--   root_dir = require 'lspconfig/util'.root_pattern(".git", vim.fn.getcwd()),
--   -- cmd = function(runtime, volume, image)
--   --   return {
--   --     runtime,
--   --     "container",
--   --     "run",
--   --     "--interactive",
--   --     "--rm",
--   --     "--volume",
--   --     volume,
--   --     image
--   --   }
--   -- end,
--   -- }),
-- }


-- this is the function that loads the extra snippets to luasnip
-- from rafamadriz/friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load()
require('luasnip.loaders.from_snipmate').lazy_load()
