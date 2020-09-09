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
    use 'junegunn/goyo.vim'
    use 'junegunn/limelight.vim'

    use 'neovim/nvim-lsp'
    use 'tjdevries/nlua.nvim'
    use 'nvim-lua/lsp-status.nvim'
    use 'nvim-lua/completion-nvim'

    use 'pangloss/vim-javascript'
    use 'leafgarland/typescript-vim'
    use 'peitalin/vim-jsx-typescript'
    use 'mxw/vim-jsx'

    use { 'scrooloose/nerdtree', opt = true, cmd = { 'NERDTreeToggle' } }

    use 'gruvbox-community/gruvbox'
  end
)
