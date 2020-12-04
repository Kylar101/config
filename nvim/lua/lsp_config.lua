local nvim_lsp = require('lspconfig')
local nvim_status = require('lsp-status')
local completion = require('completion')

local status = require('lsp_status')

local mapper = function(mode, key, result)
  vim.fn.nvim_buf_set_keymap(0, mode, key, result, { noremap = true, silent = true })
end

local setup_custom_diagnotics = function()
  Diagnostic = require('vim.lsp.actions').Diagnostic
  Location = require('vim.lsp.actions').Location

  vim.lsp.callbacks["textDocument/publishDiagnostics"] = Diagnostic.handle_publish_diagnostics.with {
    should_underline = false,
    update_in_insert = false
  }

  mapper(
    'n',
    '<leader>dn',
    '<cmd>lua vim.lsp.structures.Diagnostic.buf_move_next_diagnostic()<cr>'
  )
  mapper(
    'n',
    '<leader>dp',
    '<cmd>lua vim.lsp.structures.Diagnostic.buf_move_prev_diagnostic()<cr>'
  )
end

status.activate()

local custom_attach = function(client)
  completion.on_attach(client)
  status    .on_attach(client)

  -- mapper('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<cr>')
  mapper('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
  mapper('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<cr>')
  mapper('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

  mapper('n', '<leader>ls', '<cmd>lua vim.lsp.util.show_line_diagnostics()<cr>')

  mapper(
    'n',
    '<leader>gd',
    '<cmd>lua vim.lsp.buf.definition { callbacks = { Location.jump_first, Location.highlights.with { timeout = 300 } } }<cr>'
  )
  mapper(
    'n',
    '<leader>pd',
    '<cmd>lua vim.lsp.buf.definition { callbacks = { Location.preview.with { lines_below = 5 } } }<cr>'
  )
end

-- lua config
-- require('nlua.lsp.nvim').setup(nvim_lsp, {
--   on_attach = custom_attach
-- })

nvim_lsp.omnisharp.setup{
  on_attach = custom_attach
}

nvim_lsp.tsserver.setup{
  on_attach = custom_attach
}

nvim_lsp.vuels.setup{
  on_attach = custom_attach
}




