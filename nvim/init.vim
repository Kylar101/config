" lua require('plugins')
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive', { 'on': 'Gstatus' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'gruvbox-community/gruvbox'

call plug#end()

if (has('termguicolors'))
  set termguicolors
endif

let g:mapleader = " "

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" Keybindings

" General
imap jk <ESC>
map <leader><leader> :
map <leader>fs :w<CR>
map <leader>fq :q<CR>
map <leader>le $
map <leader>ls ^

" Tabs
map <leader>ts :tab split<CR>
map <leader>tn :tabe<CR>
map <leader>tc :tabc<CR>
map <leader>to :tabo<CR>

" Window
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <leader>wv <C-w>v
nnoremap <leader>ws <C-w>s

" project
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>pf :GFiles<CR>
nnoremap <leader>ff :Files<CR>
map \ :NERDTreeToggle<CR>

" Settings
set relativenumber " show line numbers
set number " show the actual linke number for the line we are on

" colorscheme
colorscheme gruvbox
set background=dark
