local map = function(key, fn, options, buffer)
  local mode = 'n'
  local rhs = string.format(
    "<cmd>lua require('c.telescope')['%s']('%s')<CR>",
    fn,
    options and vim.inspect(options, { newline = '' }) or ''
  )
  local options = {
    noremap = true,
    silent = true
  }

  if not buffer then
    vim.api.nvim_set_keymap(mode, key, rhs, options)
  else
    vim.api.nvim_buf_set_keymap(0, mode, key, rhs, options)
  end
end

map('<leader>en', 'edit_neovim')

map('<leader>pf', 'git_files')

map('<leader>qf', 'lsp_code_actions')

map('<leader>sw', 'find_in_files')

map('<leader>df', 'lsp_diagnostics')
