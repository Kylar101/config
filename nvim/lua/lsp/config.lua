require('lsp.completion')
local nvim_lsp = require('lspconfig')
local nvim_status = require('lsp-status')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local status = require('lsp.status')

local mapper = function(mode, key, result)
  vim.keymap.set(mode, key, result, { noremap = true, silent = true })
end

status.activate()

local custom_attach = function(client)
  status.on_attach(client)

  mapper('n', 'gd', vim.lsp.buf.definition)
  mapper('n', 'gT', vim.lsp.buf.type_definition)
  mapper('n', 'gi', vim.lsp.buf.implementation)
  mapper('n', 'gr', vim.lsp.buf.references)
  mapper('n', 'K', vim.lsp.buf.hover) -- help docs in popup
  mapper('n', '<leader>r', vim.lsp.buf.rename)

-------------------------------------------------------------------------------
---------------------------- DIAGNOSTICS --------------------------------------
-------------------------------------------------------------------------------

  mapper('n', '<leader>dn', vim.diagnostic.goto_next)
  mapper('n', '<leader>dp', vim.diagnostic.goto_prev)
end

-- nvim_lsp.omnisharp.setup{
--   on_attach = custom_attach
-- }

nvim_lsp.tsserver.setup({
  cmd = {"typescript-language-server", "--stdio"},
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.jsx"
  },
  on_attach = custom_attach,
  capabilities = capabilities
})

nvim_lsp.vuels.setup{
  on_attach = custom_attach,
  capabilities = capabilities
}


nvim_lsp.rust_analyzer.setup({
  on_attach = custom_attach,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "module",
        importPrefix = "by_self",
      },
      cargo = {
        loadOutDirsFromCheck = true
      },
      procMacro = {
        enable = true
      }
    }
  }
})



