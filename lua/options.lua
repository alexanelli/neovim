-- ####################
-- Options
-- ####################

-- `:help vim.opt`
-- see the list via `:help option-list`
-- or at https://neovim.io/doc/user/options.html

-- functionality
vim.opt.mouse = 'a' -- Mouse stuff, good for split resizing, `a` for all modes
vim.opt.scrolloff = 10 -- Minimum number of lines to keep above and below cursor
vim.opt.timeoutlen = 300 -- Decrease mapped sequence and which-key wait time (default is 1000ms) - from kickstart
vim.opt.undofile = true -- save undo history to a file so it persists between sessions - from kickstart
vim.opt.updatetime = 250 -- backup to swap file 250ms after I stop typing (default is 4000ms) - from kickstart
vim.opt.swapfile = false -- bad

-- display
vim.opt.cursorline = true -- highlight cursor line
vim.opt.hlsearch = true -- Highlight matches when searching
vim.opt.inccommand = 'split' -- show substitution command output in a live preview window - from kickstart
vim.opt.number = true -- Show line numbers
vim.opt.showmode = false -- Don't put the mode info on the last line, mode is already shown in status line - from kickstart
vim.opt.signcolumn = 'yes' -- show left hand side column for symbols (like debug breakpoints) - from kickstart
vim.opt.termguicolors = true -- force neovim to use 24bit colors

-- indenting
vim.opt.breakindent = true -- wrapped lines continue visually indented - from kickstart
vim.opt.shiftround = true -- Round indents to nearest indent size when using < or >
vim.opt.tabstop = 4 -- Display tabs 4 spaces wide, don't need anymore because of tpope/sleuth?
vim.opt.shiftwidth = 4

-- folding
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldmethod = 'expr'
vim.opt.foldlevelstart = 99 -- Default to no folds closed on new buffers
vim.opt.foldnestmax = 5 -- Don't make me dig through more than 5 folds

-- open splits in a sane way
vim.opt.splitbelow = true -- Open horizontal splits below current buffer
vim.opt.splitright = true -- Open vertical splits to the right of current buffer

-- Case-insensitive searching UNLESS \C, \c, or a capital letter is in the search term
vim.opt.ignorecase = true -- Required for smartcase
vim.opt.smartcase = true

-- show fancy characters for weird or important whitespace characters
-- I tried not to use any fancy characters here for compatibility but it probably doesn't really matter
-- so TODO maybe someday use cool ones instead like: tab = '» ', trail = '·', nbsp = '␣'
-- see `:help 'list'` and `:help 'listchars'`
-- TODO: this isn't working? sortof? the color doesn't update correctly
vim.api.nvim_set_hl(0, 'SpecialKey', { ctermfg = 'DarkGrey' })
vim.api.nvim_set_hl(0, 'NonText', { ctermfg = 'DarkGrey' })
-- vim.opt.showbreak = '\\'
vim.opt.list = true
vim.opt.listchars = { tab = '> ', trail = '_', extends = '>', precedes = '<', nbsp = '~' }
