filetype plugin on
filetype plugin indent on

" Allows switching to Visual and selecting text with mouse
" set mouse=a

set textwidth=78

set backspace=indent,eol,start	" more powerful backspacing
set ruler			" show the cursor position all the time
syntax on 			" enables syntax highlighting
set showcmd			" Show (partial) command in status line.
set number			" show line numbers
set bg=dark			" use colors for dark background

" Easier (smarter) way to move between windows:
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Default tabses
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

" autocmd Filetype gdscript setlocal ts=4 noexpandtab

augroup expandedShortTab
    autocmd!
    autocmd Filetype sql,html,css,javascript setlocal ts=2 sw=2 sts=2 expandtab
augroup END

augroup PythonIndent
    autocmd!
    autocmd Filetype python setlocal ts=4 sw=4 sts=4 expandtab
augroup END

autocmd Filetype text setlocal fo+=wa
" autocmd Filetype c setlocal ts=8 sw=8 sts=8 noexpandtab

" Show whitespace (other than space) as darkgray symbols:
set list
"set listchars=tab:\|.,eol:¬,extends:>,precedes:<
"hi NonText ctermfg=0 cterm=bold
"hi SpecialKey ctermfg=0 cterm=bold
" set listchars=tab:¦-,eol:¶,extends:>,precedes:<,space:·
" set listchars=tab:¦⇥,eol:¶,extends:>,precedes:<,space:˽
set listchars=tab:¦-,eol:↵,extends:>,precedes:<,space:˲
hi NonText ctermfg=8 cterm=NONE
hi SpecialKey ctermfg=8 cterm=NONE


" Print options
set printfont=Monospace:h6
set printoptions=paper:A4,duplex:off,number:y,left:5pc,right:8pc

" Allow per-project configuration files
set exrc
set secure

