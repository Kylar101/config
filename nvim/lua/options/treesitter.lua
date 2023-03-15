local custom_captures = {
  ['foo.bar'] = 'Identifier',
  ['function.call'] = 'LuaFunctionCall',
  ['function.bracket'] = 'Type'
}

local treesitterpath = vim.fn.stdpath "data" .. "/treesitter"
vim.opt.runtimepath:append(treesitterpath)

require('nvim-treesitter.configs').setup {
  parser_install_dir = treesitterpath,
  ensure_installed = {
    "lua",
    "typescript",
    "javascript",
    "rust",
    "tsx",
    "vue",
    "json",
    "dockerfile"
  },
  highlight = {
    enable = true,
    disable = {"json"},
    use_languagetree = false,
    custom_captures = custom_captures
  },
  indent = {
    enable = true
  }
}
