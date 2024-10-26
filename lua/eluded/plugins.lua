-- Automatically run PackerCompile when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
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
      require("notify").setup({ top_down = false })
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

  -- Copilot code completion
  -- https://github.com/zbirenbaum/copilot.lua
  use {
    "zbirenbaum/copilot.lua",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = false,
          keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
          }
        },
        panel = { enabled = false },
      })
    end
  }

  -- Make copilot a nvim-cmp source
  -- https://github.com/zbirenbaum/copilot-cmp
  -- use {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end
  -- }

  -- Easily comment out code
  -- https://github.com/tpope/vim-commentary
  use 'tpope/vim-commentary'

  -- Surround text with quotes, brackets, etc.
  -- https://github.com/tpope/tim-surround
  use 'tpope/vim-surround'

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
  use 'lspcontainers/lspcontainers.nvim'

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
  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require("eluded.config.cmp")
    end
  }
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

  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("eluded.config.harpoon")
    end
  }

  use {
    "stevearc/conform.nvim",
    config = function()
      require("eluded.config.conform")
    end,
  }

  use {
    "nvim-telescope/telescope-project.nvim",
    -- config = function()
    --   require 'telescope'.load_extension('project')
    -- end
  }

  -- Buffer history for better navigation
  -- https://github.com/dhruvasagar/vim-buffer-history
  use "dhruvasagar/vim-buffer-history"

  -- Git integration
  -- https://github.com/NeogitOrg/neogit
  use {
    "NeogitOrg/neogit",
    requires = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
    },
    config = function()
      require('neogit').setup()
    end
  }

  -- Icon picker
  -- https://github.com/ziontee113/icon-picker.nvim
  use "stevearc/dressing.nvim"
  use({
    "ziontee113/icon-picker.nvim",
    config = function()
      require("eluded.config.icon-picker")
    end,
  })

  use {
    "yetone/avante.nvim",
    requires = {
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below is optional, make sure to setup it properly if you have lazy=true
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
    config = function()
      require("avante").setup({
        provider = "openai"
      })
    end,
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
