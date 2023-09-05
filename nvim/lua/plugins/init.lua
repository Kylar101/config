return {
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'nvim-lua/telescope.nvim',

  { 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate" },
  { 'akinsho/toggleterm.nvim', version = "*", config = true },

  -- lsp
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'dcampos/nvim-snippy',
  'dcampos/cmp-snippy',
  'tjdevries/nlua.nvim',
  'nvim-lua/lsp-status.nvim',

  -- styling

  -- themes
  'nvim-lualine/lualine.nvim',
  'rebelot/kanagawa.nvim'
}
