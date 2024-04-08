-- Automatically run PackerCompile when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
  -- https://github.com/wbthomason/packer.nvim
  use 'wbthomason/packer.nvim'

  -- Color scheme
  -- https://github.com/rebelot/kanagawa.nvim
  use "rebelot/kanagawa.nvim"

  -- Treesitter for better syntax highlighting
  -- https://github.com/nvim-treesitter/nvim-treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
  }

  -- Icons for file explorer
  -- https://github.com/nvim-tree/nvim-web-devicons
  use 'nvim-tree/nvim-web-devicons'

  -- Easier tmux navigation
  -- https://github.com/aserowy/tmux.nvim
  use({
    "aserowy/tmux.nvim",
    config = function()
      require("eluded.config.tmux")
    end
  })

  -- Status line
  -- https://github.com/nvim-lualine/lualine.nvim
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require('eluded.config.lualine')
    end
  }

  -- Fancy notifications
  -- https://github.com/rcarriga/nvim-notify
  use {
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require("notify")
    end
  }

  -- Easy directory editing
  -- https://github.com/stevearc/oil.nvim
  use {
    "stevearc/oil.nvim",
    config = function()
      require("eluded.config.oil")
    end,
  }

  -- Dependency of other plugins like telescope
  -- https://github.com/nvim-lua/plenary.nvim
  use 'nvim-lua/plenary.nvim'

  -- Copilot for better code completion
  -- https://github.com/github/copilot.vim
  use 'github/copilot.vim'

  -- Easily comment out code
  -- https://github.com/tpope/vim-commentary
  use 'tpope/vim-commentary'

  -- LSP Setup
  -- https://github.com/VonHeikemen/lsp-zero.nvim
  use 'VonHeikemen/lsp-zero.nvim'

  -- Plugin manager for LSP
  -- https://github.com/williamboman/mason.nvim
  use 'williamboman/mason.nvim'

  -- https://github.com/williamboman/mason-lspconfig.nvim
  -- LSP configurations for mason
  use 'williamboman/mason-lspconfig.nvim'
  use "neovim/nvim-lspconfig"

  -- Snippets
  -- https://github.com/L3MON4D3/LuaSnip
  use {
    "L3MON4D3/LuaSnip",
    config = function()
      require("eluded.config.luasnip")
    end
  }

  -- nvim-cmp for autocompletion
  -- https://github.com/hrsh7th/nvim-cmp
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-nvim-lua"
  use "rafamadriz/friendly-snippets"


  -- Indent lines
  -- https://github.com/lukas-reineke/indent-blankline.nvim
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("eluded.config.indent-blankline")
    end
  }

  -- File explorer
  -- https://github.com/nvim-tree/nvim-tree.lua
  use {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require("eluded.config.nvim-tree")
    end
  }

  -- File browser for telescope
  -- https://github.com/nvim-telescope/telescope-file-browser.nvim
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }

  -- Telescope plugin for most frequently used files
  -- https://github.com/nvim-telescope/telescope-frecency.nvim
  use {
    "nvim-telescope/telescope-frecency.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension "frecency"
    end,
  }

  -- Fuzzy file finder
  -- https://github.com/nvim-telescope/telescope.nvim
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require('eluded.config.eluded-telescope')
    end
  }

  use {
    "benfowler/telescope-luasnip.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension "luasnip"
    end,
  }

  -- Neotest for running tests
  -- https://github.com/nvim-neotest/neotest
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      'nvim-neotest/neotest-jest',
    },
    config = function()
      require("eluded.config.neotest")
    end
  }

  -- Markdown preview
  -- https://github.com/iamcco/markdown-preview.nvim
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = {
        "markdown" }
    end,
    ft = { "markdown" },
  })

  if packer_bootstrap then
    require('packer').sync()
  end
end)
