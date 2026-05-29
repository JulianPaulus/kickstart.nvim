return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  build = ':TSUpdate',
  lazy = false,
  config = function()
    -- Custom EJS parser must be registered inside a User TSUpdate autocmd
    vim.api.nvim_create_autocmd('User', {
      pattern = 'TSUpdate',
      callback = function()
        require('nvim-treesitter.parsers').ejs = {
          install_info = {
            url = 'https://github.com/tree-sitter/tree-sitter-embedded-template',
            generate = true,
          },
        }
      end,
    })

    -- Map the 'ejs' filetype to the 'ejs' parser
    vim.treesitter.language.register('ejs', 'ejs')

    -- Install parsers on startup (async, no-op if already installed)
    require('nvim-treesitter').install({
      'bash',
      'c',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'vim',
      'vimdoc',
      'rust',
      'javascript',
      'typescript',
      'java',
      'kotlin',
      'go',
      'yaml',
      'json',
    })
  end,
}
