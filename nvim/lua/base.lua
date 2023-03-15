--  load lsp
local ok, msg = pcall(function() require('lsp.config') end)
if not ok then
  print(msg)
end

require('options.treesitter')
require('options.toggleterm')

require('options.telescope')

require('lualine').setup({
  options = {
    globalstatus = true
  }
})

-- autoload files
for _, mod in ipairs(vim.api.nvim_get_runtime_file('lua/auto/**/*.lua', true)) do
  ok, msg = pcall(loadfile(mod))

  if not ok then
    print("Failed to load: ", mod)
    print("\t", msg)
  end
end
