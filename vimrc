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

set incsearch " highlight as searching
set hlsearch " highlight all searches

" Searching for files
set path+=**
set wildmenu
set wildignore=.gitignore,.git,tags,node_modules,target " you dont want to search certain directories and files with wildmenu

set completeopt=menuone,noinsert,preview " one completion menu and no inserting per default
set laststatus=2 " always show statusline
set cursorline " needed for raven colorscheme
set autoread " if a file has been changed outside of vim read it automatically
set shell=zsh " set the default terminal shell to zsh (bash duplicates the prompt for some reason)
" set tags+=~/.vim/systags " add the systags file for autocompletion

" rust
let g:rustc_path = '/usr/bin/rustc'
" }}}

set exrc " local project config (see :h 'exrc')

" netrw {{{
let g:netrw_banner=0 " no banner
let g:netrw_liststyle=3 " tree view
let g:netrw_winsize = 20 " set the window size to 20
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
	autocmd FileType python setl ofu=python3complete#Complete
	autocmd FileType javascript setl ofu=javascriptcomplete#CompleteJS
	autocmd FileType css setl ofu=csscomplete#CompleteCSS
	autocmd FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
	autocmd FileType c setl ofu=ccomplete#Complete
augroup END
" }}}
" Code Style Guides: {{{
augroup Styles
	autocmd FileType python setl ts=4 sts=4 sw=4 et
	autocmd FileType rust setl ts=4 sts=4 sw=4 et
augroup END
" }}}


" Make tags for the current project but only files that are tracked by git (requires ctags)
command! MakeTags call system("ctags $(git ls-files)")

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

" statusline
let g:ravenline_powerline = 1 " enable powerline symbols

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
