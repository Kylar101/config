
"    ____  __.       .__
"    |    |/ _|___.__.|  | _____ _______
"    |      < <   |  ||  | \__  \\_  __ \
"    |    |  \ \___  ||  |__/ __ \|  | \/
"    |____|__ \/ ____||____(____  /__|
"            \/\/               \/
"

lua require('plugins')

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

nnoremap <leader>pt :ToggleTerm<CR>

" project
nnoremap <leader>pw :lua require'telescope.builtin'.live_grep{}<CR>
"nnoremap <leader>pf :lua require'telescope.builtin'.git_files{}<CR>
map \ :NERDTreeToggle<CR>

" Settings
set relativenumber " show line numbers
set number " show the actual linke number for the line we are on
set nohlsearch

set undodir=~/.vim/undodir
set undofile
set noswapfile
set nobackup

set signcolumn=yes
set scrolloff=8

set shiftwidth=2 tabstop=2 softtabstop=4 expandtab autoindent smartindent
setlocal colorcolumn=80

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" colorscheme
colorscheme kanagawa
set background=dark
syntax enable

" Autocommands
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup Kylar
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
augroup END

