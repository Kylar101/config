vim.cmd [[packadd packer.nvim]]
vim._update_package_paths()

return require('packer').startup(
  function(use)
    use { 'wbthomason/packer.nvim', opt = true }
    use 'nvim-lua/telescope.nvim'

    use { 'scrooloose/nerdtree', opt = true, cmd = { 'NERDTreeToggle' } }
    use { 'junegunn/fzf', opt = true, run = 'fzf#install()' }
    use { 'junegunn/fzf.vim', opt = true, cmd = { 'GFiles', 'Files', 'Rg' } }

    use 'gruvbox-community/gruvbox'
  end
)
