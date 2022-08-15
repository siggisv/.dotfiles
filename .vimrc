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

" Color settings
" --------------
colorscheme desert	" Similar, but better than the default.
set bg=dark			" use colors for dark background

  " Highlight linenumber of current cursor position:
set cursorline
highlight clear CursorLine
highlight CursorLineNr ctermbg=red

  " Show whitespace as darkgray symbols:
set list
set listchars=tab:¦-,eol:↵,extends:>,precedes:<,space:˲
hi NonText ctermfg=8 cterm=NONE
hi SpecialKey ctermfg=8 cterm=NONE


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

" Filetype dependant configs
augroup expandedShortTab
    autocmd!
    autocmd Filetype sql,html,css,javascript setlocal ts=2 sw=2 sts=2 expandtab
augroup END

augroup expandedMedTab
    autocmd!
    autocmd Filetype python,c,cpp,cmake setlocal ts=4 sw=4 sts=4 expandtab
augroup END

autocmd Filetype text setlocal fo+=wa

" Print options
set printfont=Monospace:h6
set printoptions=paper:A4,duplex:off,number:y,left:5pc,right:8pc

" Allow per-project configuration files
set exrc
set secure

