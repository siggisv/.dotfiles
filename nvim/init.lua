vim.cmd [[
call plug#begin()

    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()
]]

vim.opt.textwidth = 78
vim.opt.number = true    -- show line number

-- Color settings
-- --------------

vim.opt.termguicolors = true
vim.cmd.colorscheme('neonormal')

vim.opt.guicursor = {
	'n-v-c-sm:block',
	'ci-ve-i:ver25-Cursor/lCursor',
	'r-cr-o:hor20-Cursor/lCursor',
}

-- - Highlight linenumber of current cursor position:
vim.opt.cursorline = true

-- - Show whitespace as darkgray symbols:
vim.opt.list = true
vim.opt.listchars = {
	tab = '¦─⇥',
	eol = '↵',
	extends = '>',
	precedes = '<',
	multispace = '.',
	lead = '.',
	trail = '-'
}

-- - Customization of the indent-blankline plugin:
require('indent_blankline').setup {
    show_end_of_line = true,
	show_current_context = true,

	char_blankline = '╵',
	-- char_blankline = '┆',
}
vim.cmd.highlight({ 'IndentBlanklineContextChar', 'guifg=#406840 gui=bold' })

-- Easier (smarter) way to move between windows:
vim.keymap.set('', '<C-j>', '<C-W>j')
vim.keymap.set('', '<C-k>', '<C-W>k')
vim.keymap.set('', '<C-h>', '<C-W>h')
vim.keymap.set('', '<C-l>', '<C-W>l')

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank() end,
  desc = 'Briefly highlight yanked text'
})

-- Default tabses
vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Filetype dependant configs
local short_tab_group = vim.api.nvim_create_augroup('expanded short tab', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'sql', 'html', 'css', 'javascript', 'markdown', 'yaml', 'cpp' },
	group = short_tab_group,
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true
	end,
	desc = 'Tab is only 2 char wide and is always expanded to spaces'
})

local med_tab_group = vim.api.nvim_create_augroup('expanded medium tab', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'python', 'c', 'cmake' },
	group = med_tab_group,
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.expandtab = true
	end,
	desc = 'Tab is 4 char wide and is always expanded to spaces'
})

local text_group = vim.api.nvim_create_augroup('text file', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'text',
	group = text_group,
	callback = function()
		vim.opt_local.formatoption:append({ 'w', 'a' })
	end,
	desc = 'Autoformat whole paragraph in text files'
})

-- Treesitter settings:

require'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = {
		'c', 'lua', 'vim', 'vimdoc', 'query', -- the default ones
		'bash',
		'cmake',
		'cpp',
		'comment',
		'gitcommit',
		'python',
		'markdown', 'markdown_inline',
	},

	highlight = {
		enable = true
	},
}
