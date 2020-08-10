" lua require('plugins')
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mxw/vim-jsx'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive', { 'on': 'Gstatus' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'gruvbox-community/gruvbox'
Plug 'hardcoreplayers/oceanic-material'

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

" LSP
let g:coc_force_debug = 1
let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint', 'coc-json']
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gh <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <F2> <Plug>(coc-rename)
nmap <leader>qf <Plug>(coc-fix-current)
autocmd CursorHold * silent call CocActionAsync('highlight')

" Settings
set relativenumber " show line numbers
set number " show the actual linke number for the line we are on

" colorscheme
colorscheme oceanic_material
set background=dark
syntax enable
