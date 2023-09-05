
--    ____  __.       .__
--    |    |/ _|___.__.|  | _____ _______
--    |      < <   |  ||  | \__  \\_  __ \
--    |    |  \ \___  ||  |__/ __ \|  | \/
--    |____|__ \/ ____||____(____  /__|
--            \/\/               \/

local opt = vim.opt

vim.g.mapleader = " "

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  }
end
opt.runtimepath:prepend(lazypath)
vim.filetype.add({ extensions = { yml = "yaml" }})

local map = require('options.keymap').map

require("lazy").setup("plugins", {
  ui = {
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      source = "📄",
      start = "🚀",
      task = "📌",
    },
  },
})

require('base')

-- general
map("i", "jk", "<ESC>")
map('n', '<leader><leader>', ':')
map('n', '<leader>fs', ':w<CR>')
map('n', '<leader>fq', ':q<CR>')
map('n', '<leader>le', '$')
map('n', '<leader>ls', '^')

-- tabs
map('n', '<leader>ts', ':tab split<CR>')
map('n', '<leader>tn', ':tabe<CR>')
map('n', '<leader>tc', ':tabc<CR>')
map('n', '<leader>tc', ':tabo<CR>')

-- window
map('n', '<leader>wh', '<C-w>h')
map('n', '<leader>wj', '<C-w>j')
map('n', '<leader>wk', '<C-w>k')
map('n', '<leader>wl', '<C-w>l')
map('n', '<leader>wv', '<C-w>v')
map('n', '<leader>ws', '<C-w>s')

-- map('n', '<leader>pt', ':ToggleTerm<CR>')
map('t', 'jk', '<C-\\><C-n>')

require('options.telescope.mappings')

-- settings
opt.termguicolors = true
opt.relativenumber = true
opt.number = true

opt.signcolumn = 'yes'
opt.scrolloff = 8

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 4
opt.expandtab = true
opt.autoindent = true

opt.laststatus = 3

vim.cmd [[
  colorscheme kanagawa
  syntax enable
]]
opt.background = 'dark'
