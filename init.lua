--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

    You can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

  run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something.

    There's a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

If you experience any errors while trying to install, run `:checkhealth` for more info.

--]]

-- ####################
--- Leader
-- ####################

-- Using comma as the leader key
-- I chose comma because you usually hit space after a comma, which leaves every other key free to be assigned with no weirdness
-- considered using space, but it adds delay for some people?
-- If you use space, make sure you have no other semi-conflicting bindings causing lag by searching via `verbose imap <space>`
-- `g` is also another decent consideration (as vim already has mappings that start with `g` so it feels conventional)

-- See `:help mapleader`

-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- ,cp - Set for COPY mode (turn off non-printing chars)
-- getting rid of these for now as they seem to maybe intersect with some of the kickstart stuff
-- vim.api.nvim_set_keymap('n', '<Leader>cp', ':set nonumber<CR>:set nolist<CR>', {})
-- ,pc - Opposite of ,cp - turns on non-printing chars
-- vim.api.nvim_set_keymap('n', '<Leader>pc', ':set number<CR>:set list<CR>', {})

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'

-- ####################
-- TODO
-- ####################

-- maybe try relative line numbers for better jumping?
-- I don't really do jumping rn so it'd be a habit change
-- vim.opt.relativenumber = true

-- Sync clipboard between OS and Neovim.
-- this is on in kickstart, not sure if worth revisiting but last time I tried this I remember it being annoying
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.schedule(function()
--   vim.opt.clipboard = 'unnamedplus'
-- end)

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

-- look into "copyindent" (vim option)
