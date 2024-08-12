-- Alex's neovim config (most of which is shamelessly stolen)

-- use ctrl+hjkl to move between splits
vim.keymap.set("n", "<C-J>", "<C-W><C-J>", { noremap = true })
vim.keymap.set("n", "<C-K>", "<C-W><C-K>", { noremap = true })
vim.keymap.set("n", "<C-H>", "<C-W><C-H>", { noremap = true })
vim.keymap.set("n", "<C-L>", "<C-W><C-L>", { noremap = true })

-- Rebind jk to <ESC>
vim.keymap.set("i", "jk", "<Esc>", { noremap = true })

--[[
if you're here for vscode it looks like this:
"vim.insertModeKeyBindings": [
  {
    "before": ["j", "k"],
    "after": ["<Esc>"] 
  }
]
--]]

-- ##### LEADER STUFF #####
vim.g.mapleader = ","

--   ,cp - Set for COPY mode (turn off non-printing chars)
vim.api.nvim_set_keymap("n", "<Leader>cp", ":set nonumber<CR>:set nolist<CR>", {})

--   ,pc - Opposite of ,cp - turns on non-printing chars
vim.api.nvim_set_keymap("n", "<Leader>pc", ":set number<CR>:set list<CR>", {})


-- ##### OPTIONS #####
vim.opt.mouse = "a"                      -- Mouse stuff
vim.opt.autoindent = true                    -- Automatically indent on newlines
vim.opt.autowrite = true                     -- Automatically save before commands like :next and :make
vim.opt.foldlevelstart = 99             -- Default to no folds closed on new buffers
vim.opt.foldmethod = "syntax"             -- Fold using syntax by default
vim.opt.foldnestmax = 5                 -- Don't make me dig through more than 5 folds
vim.opt.hlsearch = true                      -- Highlight matches when searching
vim.opt.ignorecase = true                    -- Required for proper smartcase functionality
vim.opt.lazyredraw = true                    -- Improves perf under some conditions
vim.opt.number = true                      -- Show line numbers
vim.opt.pastetoggle = "<F2>"               -- Toggle paste mode with F2
vim.opt.scrolloff = 5                      -- Minimum # of lines to keep above and below cursor
vim.opt.shiftround = true                  -- Round indents to nearest indent size when using < or >
vim.opt.showmode = true                    -- Show me what mode I'm in
vim.opt.smartcase = true                   -- Case insensitive unless typing with caps
vim.opt.splitbelow = true                  -- Open horizontal splits below current buffer
vim.opt.tabstop = 2                        -- Display tabs 2 spaces wide
vim.opt.splitright = true                  -- Open vertical splits to the right of current buffer
vim.opt.termguicolors = true               -- Force GUI colors in terminals
vim.opt.virtualedit = "block"              -- Allow cursor to be placed in virtual positions when in visual block mode
-- vim.opt.wildmode = "longest,list:longest"  -- use zsh-ish behavior for text completion
-- vim.opt.wildoptions+=pum              -- Display the completion matches using a popupmenu

-- vim.opt.completeopt = "menu"     -- Use a popup menu to show the possible completions
-- vim.opt.completeopt:append { "menuone" }  -- Use the popup menu also when there is only one match
-- vim.opt.completeopt:append { "noinsert" } -- Do not insert any text for a match until the user selects a match from the menu
-- vim.opt.completeopt:append { "noselect" } -- Do not select a match in the menu, force the user to select one from the menu

vim.opt.formatoptions:append { "r" } -- DO insert the current comment leader after hitting <Enter> in Insert mode.

-- show me fancy characters for whitespace characters
vim.api.nvim_set_hl(0, "SpecialKey", {ctermfg = "DarkGrey"})
vim.api.nvim_set_hl(0, "NonText", {ctermfg = "DarkGrey"})
vim.opt.showbreak= "\\"
vim.opt.list = true
vim.opt.listchars = { tab = "> " , trail = "_", extends = ">", precedes = "<", nbsp = "~" }

-- TODO not working
-- vim.opt.shortmess:append { "c" }  -- Don't give ins-completion-menu messages
-- vim.opt.shortmess:append { "I" }  -- Don't show the intro message when starting vim

-- idk what these are for
-- vim.opt.wildignore=tags
-- vim.opt.wildignore+=*.o
-- vim.opt.wildignore+=*.py?

-- boostrap lazy (plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- set up plugins (loaded from ~/.config/nvim/lua/plugins.lua)
-- custom flags from https://github.com/wbthomason/dotfiles/blob/main/dot_config/nvim/init.lua
require('lazy').setup('plugins', {
  defaults = { lazy = true },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchit',
        'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})

