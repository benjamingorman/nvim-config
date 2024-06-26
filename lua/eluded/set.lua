-- Custom mapping <leader> (see `:h mapleader` for more info)
vim.g.mapleader = ' '

vim.opt.nu = true
vim.o.relativenumber = true

vim.o.smartindent = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
if vim.fn.has('win32') == 1 then
  -- Windows
  vim.opt.undodir = os.getenv("userprofile") .. "/AppData/Local/nvim-data/undodir"
else
  -- MacOS
  vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
end
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "no"

vim.opt.ignorecase = true
vim.opt.smartcase = true
