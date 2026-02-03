
-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Rebind jk to <ESC>
--[[
if you're here for vscode it looks like this:
"vim.insertModeKeyBindings": [
  {
    "before": ["j", "k"],
    "after": ["<Esc>"]
  }
]
--]]
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })

-- shotcuts for copy/paste with system clipboard
vim.keymap.set('v', '<leader>c', '"+y', {desc = '[c]opy to system clipboard'})

-- INSERT STUFF
-- todays date
-- using [[ ]] string instead of quotes as a raw string in lua (otherwise you get escape sequence errors)
vim.keymap.set('n', '<leader>id', [[<CMD>r! date +"\%d \%b \%Y"<ENTER>]], {desc = '[i]nsert [d]ate'})

-- insert markdown list item, commenting this out for now, kind jank
-- local function insert_markdown_list()
--   vim.api.nvim_paste('- [ ]\n', false, -1)
-- end
-- vim.keymap.set('n', '<leader>iml', insert_markdown_list, { desc = '[i]nsert [m]arkdown [l]ist item' })

-- Make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move focus to the upper window' })


-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- show diagnostic in full - helpful for when it doesn't fit inline
vim.keymap.set('n', '<leader>td', '<cmd>lua vim.diagnostic.open_float(nil, { border = "rounded" })<cr>', { desc = '[t]oggle [d]iagnostic overlay'})

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })


-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
