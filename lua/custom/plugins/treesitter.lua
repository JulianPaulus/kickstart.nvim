return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = {
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
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
  config = function(_, opts)
    require('nvim-treesitter.install').prefer_git = true
    require('nvim-treesitter.configs').setup(opts)

    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config.ejs = {
      install_info = {
        url = 'https://github.com/tree-sitter/tree-sitter-embedded-template',
        files = { 'src/parser.c' },
        requires_generate_from_grammar = true,
      },
      filetype = 'ejs',
    }
  end,
}
