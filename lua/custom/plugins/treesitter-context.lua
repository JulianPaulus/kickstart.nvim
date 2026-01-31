return {
  'nvim-treesitter/nvim-treesitter-context',
  dependencies = 'nvim-treesitter/nvim-treesitter',
  config = function()
    require('treesitter-context').setup {
      enabled = true,
      line_numbers = true,
      mode = 'topline',
    }
  end,
}
