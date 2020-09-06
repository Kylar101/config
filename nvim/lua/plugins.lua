vim.cmd [[packadd packer.nvim]]
vim._update_package_paths()

return require('packer').startup(
  function(use)
    use { 'wbthomason/packer.nvim', opt = true }
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/telescope.nvim'

    use { 'scrooloose/nerdtree', opt = true, cmd = { 'NERDTreeToggle' } }

    use 'gruvbox-community/gruvbox'
  end
)
