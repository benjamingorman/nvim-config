local js_formatter = { "biome", "biome-check" };

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "ruff_format" },
    -- Use a sub-list to run only the first available formatter
    javascript = js_formatter,
    typescript = js_formatter,
    typescriptreact = js_formatter,
    terraform = { "tflint" },
    scss = { "prettier" },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1000,
    lsp_fallback = true,
  },
  -- formatters = {
  --   ruff = {
  --     -- Change where to find the command
  --     command = "ruff format",
  --   },
  -- },
})
