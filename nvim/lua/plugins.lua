vim.cmd [[packadd packer.nvim]]
vim._update_package_paths()

return require('packer').startup(
  function(use)
    use { 'wbthomason/packer.nvim', opt = true }
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/telescope.nvim'

    use { 'junegunn/fzf', run = './install --all' }
    use { 'junegunn/fzf.vim' }
    use { 'yuki-ycino/fzf-preview.vim', run = 'npm install' }

    use 'neovim/nvim-lsp'

    use { 'scrooloose/nerdtree', opt = true, cmd = { 'NERDTreeToggle' } }

    use 'gruvbox-community/gruvbox'
  end
)
