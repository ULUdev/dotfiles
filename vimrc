"Theme
colo raven
"General
syntax on
set noerrorbells
set noswapfile
set number
set noshowmode
set autoindent
set smartindent
set tabstop=4 softtabstop=4 noexpandtab shiftwidth=4
set incsearch
set hlsearch
set path+=**
set wildmenu
set completeopt=menuone,noinsert
set laststatus=2
let g:netrw_banner=0
let g:netrw_liststyle=3
"Commands
command Ptree Lex | vertical resize 20 | wincmd l
"Remaps
tnoremap <Esc> <C-\><C-n>
"Leader-maps
let mapleader=" "
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <leader>wv <C-w>v
nnoremap <leader>wo <C-w>o
nnoremap <leader>ws <C-w>s
nnoremap <leader>c :noh<CR>
"Auto Closer
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap < <><Esc>i
"auto python function/class manager
nnoremap pf idef :<Esc>i
nnoremap pc iclass :<Esc>i
nnoremap pm iimport 
nnoremap plm Oimport 
"line plugin
nnoremap cl dd kk p 
nnoremap nl O<Esc>
nnoremap hll gg V G 
