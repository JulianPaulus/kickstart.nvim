return {
  'folke/tokyonight.nvim',
  priority = 1000,
  config = function()
    require('tokyonight').setup {
      styles = {
        comments = { italic = false },
      },
    }

    vim.cmd.colorscheme 'gruvbox'
    vim.o.background = 'dark'
    vim.opt.background = 'dark'
    vim.cmd.hi 'Comment gui=none'
  end,
}
