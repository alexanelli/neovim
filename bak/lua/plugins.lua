-- This file is loaded via the "plugins" in `require("lazy").setup("plugins")` from init.vim

-- using the `VeryLazy` event for things that can load later and are not important for the initial UI

return {

  -- the colorscheme should be available when starting Neovim
  {
    "Mofiqul/dracula.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme dracula]])
    end,
  },

  -- nvim-web-devicons is a dependency of the lualine plugin
  "nvim-tree/nvim-web-devicons",
  {"nvim-lualine/lualine.nvim", lazy = true },

  -- { "github/copilot.vim", lazy = false },

}

