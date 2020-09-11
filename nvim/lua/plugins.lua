local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
vim._update_package_paths()
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

    use { 'junegunn/fzf', run = './install --all' }
    use { 'junegunn/fzf.vim' }
    use 'junegunn/goyo.vim'
    use 'junegunn/limelight.vim'

    use 'neovim/nvim-lspconfig'
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
