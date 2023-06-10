" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vim/vimrc

call plug#begin()

Plug 'Yggdroot/indentLine'

Plug 'bfrg/vim-cpp-modern'

call plug#end()

set textwidth=78

set number			" show line number

" Color settings
" --------------
set termguicolors
colorscheme neonormal

set guicursor=n-v-c-sm:block,ci-ve-i:ver25-Cursor/lCursor,
			\r-cr-o:hor20-Cursor/lCursor

  " Highlight linenumber of current cursor position:
set cursorline

  " Show whitespace as darkgray symbols:
set list
set listchars=tab:¦-,eol:↵,extends:>,precedes:<,multispace:.,trail:-


  " Customization of the indentLine plugin:
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_char = '▏'
let g:indentLine_first_char = '▏'
" if v:version <= 801
let g:indentLine_fileTypeExclude = ['markdown', 'json']
" else
"     let g:vim_json_syntax_conceal = 0
"     let g:vim_markdown_conceal = 0
"     let g:vim_markdown_conceal_code_blocks = 0
" endif


  " Customization of the vim-cpp-modern plugin

" Disable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 1

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

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

" Filetype dependant configs
augroup expandedShortTab
    autocmd!
    autocmd Filetype sql,html,css,javascript,markdown,yaml,cpp
        \ setlocal ts=2 sw=2 sts=2 expandtab
augroup END

augroup expandedMedTab
    autocmd!
    autocmd Filetype python,c,cmake setlocal ts=4 sw=4 sts=4 expandtab
augroup END

autocmd Filetype text setlocal fo+=wa

" Allow per-project configuration files
set exrc
set secure

