local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
if not packer_exists then
  if vim.fn.input("Download Packer? (y for yes") ~= "y" then
    return
  end

  local directory = string.format(
    '%s/site/pack/packer/opt',
    vim.fn.stdpath('data')
  )

  vim.fn.mkdir(directory, 'p')

  local out = vim.fn.system(string.format(
    'git clone %s %s',
    'https://github.com/wbthomason/packer.nvim',
    directory .. '/packer.nvim'
  ))

  print(out)
  print("Downloading packer.nvim...")

  return
end

return require('packer').startup(
  function(use)
    use { 'wbthomason/packer.nvim', opt = true }
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/telescope.nvim'

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
--    use 'nvim-treesitter/playground'

    use {'akinsho/nvim-toggleterm.lua'}
    use {'kristijanhusak/orgmode.nvim'}

    use { 'junegunn/fzf', run = './install --all' }
    use { 'junegunn/fzf.vim' }
    use 'junegunn/goyo.vim'
    use 'junegunn/limelight.vim'

    use 'neovim/nvim-lspconfig'
    use 'tjdevries/nlua.nvim'
    use 'nvim-lua/lsp-status.nvim'

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    use 'pangloss/vim-javascript'
    use 'leafgarland/typescript-vim'
    use 'peitalin/vim-jsx-typescript'
    use 'mxw/vim-jsx'

    use { 'scrooloose/nerdtree', opt = true, cmd = { 'NERDTreeToggle' } }
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'gruvbox-community/gruvbox'
    use 'rebelot/kanagawa.nvim'
  end
)
