" (Neo)Vim color file
"
" Partially based on 'default', 'jellybeans', 'wombat256mod' and the terminal
" version of 'desert' (as it looks when used in a terminal set to the 'Tango'
" color scheme).

hi clear
if exists("syntax_on")
	syntax reset
endif

let g:color_name="neonormal"

" -- General colors --
hi Normal		guifg=#c4ecc4	guibg=#001614	gui=none
hi Cursor		guifg=#242424	guibg=#eae788	gui=none
"hi lCursor		guifg=bg		guibg=fg
hi Visual		guifg=none		guibg=#002c28
hi Folded		guifg=#00ffaa	guibg=#485048	gui=none
hi FoldColumn	guifg=#00ffaa	guibg=#606a60	gui=none
hi MatchParen	guifg=#ffffd8	guibg=#444444	gui=none

" - Errors and warnings
hi WarningMsg					guifg=#cc0000
hi ErrorMsg		guifg=#ff2026	guibg=#3a3a3a	gui=bold
hi Error		guifg=#ffffff	guibg=#a83028	gui=bold

" - Popup menu
hi Pmenu		guifg=#ffffd7	guibg=#444444
hi PmenuSel		guifg=#080808	guibg=#cae982

" - Status and split lines
hi StatusLine	guifg=#80ff60	guibg=#405040	gui=italic
hi StatusLineNC	guifg=#749074	guibg=#1b2b1b	gui=none
hi VertSplit	guifg=#888888	guibg=none		gui=none

" - Search results and currently selected result -
hi Search		guifg=#ffff30	guibg=#304040	gui=none
hi IncSearch	guifg=#101414	guibg=#909030	gui=none

" - Line numbers and cursor line -
hi LineNr		guifg=#809888	guibg=#000a00
hi CursorLine					guibg=#000a00
hi CursorLineNr	guifg=#a8a800	guibg=#680000	gui=bold

" - Whitespace and special keys -
hi NonText		guifg=#203820
hi SpecialKey	guifg=#284028

" - Diff highlighting -
hi DiffAdd						guibg=#282828
hi DiffDelete	guifg=#abb8c8	guibg=#00af87	gui=bold
hi DiffText						guibg=#303030	gui=bold
hi DiffChange					guibg=#1a1a1a

" - Tabs
hi Title		guifg=#88ff00					gui=bold
hi TabLine		guifg=#749074	guibg=#1b2b1b	gui=underline
hi TabLineFill					guibg=#000000	gui=none
hi TabLineSel	guifg=#90ff70	guibg=#3b4b3b	gui=italic,bold

" -- Syntax highlighting --
hi Comment		guifg=#06989a	gui=italic
hi Constant		guifg=#af5f00	gui=none
"hi String			"links to Constant
"hi Character		"links to Constant
"hi Number			"links to Constant
"hi Boolean			"links to Constant
"hi Float			"links to Number
hi Identifier	guifg=#00b070	gui=bold
hi Function		guifg=#0080b0	gui=bold
hi Statement	guifg=#d4aa00	gui=none
"hi Conditional		"links to Statement
"hi Repeat			"links to Statement
"hi Label			"links to Statement
"hi Operator		"links to Statement
"hi Keyword			"links to Statement
"hi Exception		"links to Statement
hi PreProc		guifg=#844088	gui=none
"hi Include			"links to PreProc
"hi Define			"links to PreProc
"hi Macro			"links to PreProc
"hi PreCondit		"links to PreProc
hi Type			guifg=#4ea800	gui=none
"hi StorageClass	"links to Type
"hi Structure		"links to Type
"hi TypeDef			"links to Type
hi Special		guifg=#75507b	gui=none
"hi SpecialComment	"links to Special
"hi SpecialChar		"links to Special
"hi Debug			"links to Special
hi Underlined	guifg=#75507b	gui=underline
hi Todo			guifg=#2e3436	guibg=#fce94f	gui=none

" - TODO later? -
"hi CursorIM
"hi Directory
"hi Menu
"hi ModeMsg
"hi MoreMsg
"hi PmenuSbar
"hi PmenuThumb
"hi Question
"hi Scrollbar
"hi SignColumn
"hi SpellBad
"hi SpellCap
"hi SpellLocal
"hi SpellRare
"hi Tooltip
"hi User1
"hi User9
"hi WildMenu
