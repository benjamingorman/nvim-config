local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  -- https://lsp-zero.netlify.app/v3.x/language-server-configuration.html
  lsp_zero.default_keymaps({ buffer = bufnr })
  vim.api.nvim_set_keymap('n', 'g.', '<cmd>lua vim.lsp.buf.code_action()<CR>', {})
  vim.api.nvim_set_keymap('n', 'gR', '<cmd>lua vim.lsp.buf.rename()<CR>', {})
  vim.api.nvim_set_keymap('n', 'gF', '<cmd>lua vim.lsp.buf.format()<CR>', {})
  vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', {})
  vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', {})
  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = bufnr })
end)

-- https://github.com/williamboman/mason-lspconfig.nvim
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver',
    'rust_analyzer',
    'lua_ls',
    'pyright',
    'html',
    'gopls',
    'zls',
    'terraformls',
    -- 'jinja_lsp',
  },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})


-- Jinja filetypes
vim.filetype.add {
  extension = {
    jinja = 'html',
    jinja2 = 'html',
    j2 = 'html',
  },
}

local configs = require('lspconfig.configs')
if not configs.jinja_lsp then
  configs.jinja_lsp = {
    default_config = {
      name = "jinja-lsp",
      cmd = { "jinja-lsp" },
      filetypes = { "jinja", "html" },
      root_dir = function(fname)
        return "."
        --return nvim_lsp.util.find_git_ancestor(fname)
      end,
      init_options = {
        templates = 'backend/src/admium/templates',
        backend = { 'backend/src/admium/' },
        lang = "python"
      }
    }
  }
end
require('lspconfig').jinja_lsp.setup({})

require('lspconfig').pyright.setup({
  before_init = function(params, config)
    local Path = require "plenary.path"
    local venv = Path:new(vim.fn.getcwd(), ".venv")
    if venv:joinpath("bin"):is_dir() then
      vim.notify("Found venv in repo: will use for pyright LSP")
      config.settings.python.pythonPath = tostring(venv:joinpath("bin", "python"))
    end
  end
})

-- this is the function that loads the extra snippets to luasnip
-- from rafamadriz/friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load()
require('luasnip.loaders.from_snipmate').lazy_load()
