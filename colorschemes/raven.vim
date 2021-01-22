" Raven by ULUdev
" a dark/gray colorscheme for vim including statusline, tabbar, autocomplete, wildmenu
" move this file to your .vim/colors/ directory and add colo raven to your .vimrc
"


set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "raven"
hi Normal ctermfg=White ctermbg=None guifg=#dddddd	guibg=Black
hi Comment    cterm=NONE ctermfg=DarkGray    	gui=NONE guifg=#00aaaa   	 
hi Constant   cterm=NONE ctermfg=LightCyan   	gui=NONE guifg=#00ffff   	
hi Identifier cterm=NONE ctermfg=LightMagenta   gui=NONE guifg=#ff00ff   
hi Function   cterm=NONE ctermfg=Cyan   	gui=NONE guifg=#00ff00   	
hi Statement  cterm=NONE ctermfg=LightGreen	gui=NONE guifg=#ffffff	     	
hi PreProc    cterm=NONE ctermfg=Yellow		gui=NONE guifg=#ffff00 	
hi Type	      cterm=NONE ctermfg=LightCyan	gui=None guifg=#00ff00 		
hi Special    cterm=NONE ctermfg=LightRed   gui=NONE guifg=#ff0000    	
hi Delimiter  cterm=NONE ctermfg=Yellow    	gui=NONE guifg=#ffff00    	
" colors for autocompletion
hi Pmenu	  cterm=NONE ctermfg=Black		ctermbg=DarkGray
hi PmenuSel	  cterm=NONE ctermfg=Black		ctermbg=LightGray
" highlight current line
hi CursorLineNr	cterm=NONE ctermfg=LightGray ctermbg=DarkGray
" disable line below cursor
hi CursorLine cterm=NONE
hi LineNr	  cterm=NONE ctermfg=LightGray	ctermbg=NONE
hi Number	  cterm=NONE ctermfg=Cyan		ctermbg=NONE
hi Visual	  cterm=NONE ctermfg=NONE		ctermbg=DarkGray

"statusline and tabline

let g:currentmode={
	\ 'n'  : 'NORMAL ',
	\ 'v'  : 'VISUAL ',
	\ 'V'  : 'V·Line ',
	\ '' : 'V·Block ',
	\ 'i'  : 'INSERT ',
	\ 'R'  : 'REPLACE',
	\ 'Rv' : 'V·Replace ',
	\ 'c'  : 'Command ',
\}




set statusline=
set statusline+=%#StatlineStatus#
set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=%#StatlineGeneral#
set statusline+=\ %f
set statusline+=\ %h
set statusline+=%#StatlineModified#
set statusline+=\ %{&modified?'[+]':''}
set statusline+=%#StatlineGeneral#
set statusline+=%=
set statusline+=\ %y 

hi StatlineStatus cterm=NONE ctermbg=White ctermfg=DarkGray
hi StatlineGeneral cterm=None ctermbg=DarkGray ctermfg=White
hi StatlineModified cterm=NONE ctermbg=DarkGray ctermfg=Green
hi TabLine cterm=NONE ctermbg=DarkGray ctermfg=LightGray
hi TabLineSel cterm=NONE ctermbg=LightGray ctermfg=DarkGray
hi TabLineFill cterm=NONE ctermbg=NONE ctermfg=LightGray
hi WildMenu cterm=NONE ctermbg=LightGray ctermfg=Black
hi PmenuSbar cterm=NONE ctermbg=DarkGray
hi PmenuThumb cterm=NONE ctermbg=LightGray
