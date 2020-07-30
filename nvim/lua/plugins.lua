vim.cmd [[packadd packer.nvim]]
vim._update_package_paths()

return require('packer').startup(
  function(use)
    use { 'wbthomason/packer.nvim', opt = true }
    use { 'nvim-lua/telescope.nvim', opt = true }
  end
)
