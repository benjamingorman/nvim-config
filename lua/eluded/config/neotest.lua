require('neotest').setup({
  adapters = {
    require('neotest-jest')({
      jestCommand = "yarn jest",
      jestConfigFile = "jest.config.js",
      env = { CI = true },
      cwd = function(path)
        return vim.fn.getcwd()
      end,
    }),
  }
})
