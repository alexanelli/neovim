-- Treesitter
-- parser-generator/syntax-tree library, for folding, highlighting

-- https://tree-sitter.github.io/tree-sitter/
-- https://neovim.io/doc/user/treesitter/
return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  build = ':TSUpdate',
  lazy = false,
  config = function()
    local parsers = {
      'bash',
      'diff',
      'dockerfile',
      'git_config',
      'git_rebase',
      'gitattributes',
      'gitcommit',
      'gitignore',
      'go',
      'gomod',
      'gosum',
      'html',
      'json',
      'toml',
      'yaml',
      'lua',
      'luadoc',
      'make',
      'markdown',
      'markdown_inline',
      'python',
      'terraform',
      'vim',
      'vimdoc',
    }

    local nts = require 'nvim-treesitter'

    nts.install(parsers)

    -- Apparently not every tree-sitter parser is the same as the file type detected
    -- I.e. vim filetypes don't always line up with the tree-sitter parser names
    -- So the patterns need to be registered more cleverly
    -- pulled from https://mhpark.me/posts/update-treesitter-main/
    local patterns = {}
    for _, parser in ipairs(parsers) do
      local parser_patterns = vim.treesitter.language.get_filetypes(parser)
      for _, pp in pairs(parser_patterns) do
        table.insert(patterns, pp)
      end
    end

    -- turn on treesitter highlighting
    vim.api.nvim_create_autocmd('FileType', {
      pattern = patterns,
      callback = function()
        vim.treesitter.start()
      end,
    })

  end,
}
