return {
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'nvim-lua/telescope.nvim',

  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      require('nvim-treesitter/install').update({ with_sync = true })
    end
  },

  {'akinsho/toggleterm.nvim', version = "*", config = true},

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

  -- themes
  'kyazdani42/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',
  'rebelot/kanagawa.nvim'
}
