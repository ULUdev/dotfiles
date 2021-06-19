" basics {{{
colo nightfall " Theme
syntax on " syntax highliting is on
filetype plugin on
set noerrorbells " dont make any error bells
set nowrap " if the line is too long dont wrap it
set noswapfile " don't generate a swap file
set number " show line numbers
set relativenumber " show relative line numbers
set noshowmode " dont show current mode below statusbar
set scrolloff=8 " if youre scrolling down or up always leave 8 lines left (except you're at the actual beginning or end of the file)
set complete=.,t,w,b " set the completion to the current file, tags, buffers and windows
set background=dark " set a dark background
set splitbelow splitright " some splitting settings

" enable undo stuff
set undodir=~/.vim/undo
set undofile

" Indenting
set autoindent
set smartindent
set tabstop=4 softtabstop=4 noexpandtab shiftwidth=4 " set tabwidth to 4

set incsearch " show all results
set hlsearch " highlight search always

" Searching for files
set path+=**
set wildmenu
set wildignore=.gitignore,.git,tags,node_modules,target " you dont want to search certain directories and files with wildmenu

set completeopt=menuone,noinsert " one completion menu and no inserting per default
set laststatus=2 " always show statusline
set cursorline " needed for raven colorscheme
set autoread " if a file has been changed outside of vim read it automatically
set shell=zsh " set the default terminal shell to zsh (bash duplicates the prompt for some reason)
" }}}

silent! so .vimlocal " local configuration for a project

" netrw {{{
let g:netrw_banner=0 " no banner
let g:netrw_liststyle=3 " tree view
let g:netrw_winsize = 30 " set the window size to 30
let g:netrw_list_hide = netrw_gitignore#Hide() .',^node_modules$,^\.git/$,^__pycache__/$' " hide node modules and .git in the netrw list
let g:netrw_special_syntax = 1 " highlight some files/folders 
" }}}

" leader {{{
let mapleader=' ' " set the leader key to SPACE

" window commands
nnoremap <leader>w <C-w>

" quick-fix-list
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprev<CR>
nnoremap <leader>cl :clist<CR>

" using Tags for go-to-definition
nnoremap <leader>gd <C-]>
nnoremap <leader>t <C-t>

" clear search highlighting
nnoremap <leader>ch :noh<CR>

" toggle a file explorer
nnoremap <leader>d :Lexplore<CR>

nnoremap <leader>e :e $MYVIMRC<CR>

" spelling
" jumpt between wrongly spelled words
nnoremap <leader>sn ]s
nnoremap <leader>sp [s

" correct wrongy spelled word below cursor
nnoremap <leader>sc z=

" }}}

" Completion: {{{
augroup Completion
	autocmd FileType python setlocal omnifunc=python3complete#Complete
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,xhtml setlocal ofu=htmlcomplete#CompleteTags
augroup END
" }}}

" Make tags for the current project (requires ctags)
command! MakeTags call system("ctags -R $(ls | grep -vi -e '^node_modules$' -e '^\.git$' -e '^target$')")

" plugins {{{
" snippets
let g:snippets = {
	\'latex-document': readfile(expand('~/.vim/snippets/latex-document.txt')),
	\'html-document': readfile(expand('~/.vim/snippets/html-document.txt')),
	\'cpp-file': readfile(expand('~/.vim/snippets/cpp-file.txt')),
	\'cpp-header': readfile(expand('~/.vim/snippets/cpp-header.txt')),
	\'c-file': readfile(expand('~/.vim/snippets/c-file.txt')),
	\'c-header': readfile(expand('~/.vim/snippets/c-header.txt'))
\}

" Plugins
source ~/Code/vim/plugin-manager/plugin-manager.vim " load the plugin manager
let g:plugins = [
	\'snippets',
	\'bracket-closer',
	\'raven-line',
	\'git-control',
	\'vim-installer'
\]
call LoadPlugins()

" }}}

" vim: fdm=marker
