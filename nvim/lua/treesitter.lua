local custom_captures = {
  ['foo.bar'] = 'Identifier',
  ['function.call'] = 'LuaFunctionCall',
  ['function.bracket'] = 'Type'
}

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    disable = {"json"},
    use_languagetree = false,
    custom_captures = custom_captures
  },
  indentation = {
    enable = true
  }
}
