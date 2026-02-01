return {
  'hrsh7th/nvim-cmp',
  event = 'VimEnter',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {},
      opts = {},
    },
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'folke/lazydev.nvim',
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      -- Keymaps matching blink.cmp 'enter' preset
      mapping = cmp.mapping.preset.insert {
        -- Select next/previous item
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<Up>'] = cmp.mapping.select_prev_item(),
        -- Scroll documentation
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        -- Trigger completion manually
        ['<C-Space>'] = cmp.mapping.complete(),
        -- Cancel/close completion menu
        ['<C-e>'] = cmp.mapping.abort(),
        -- Accept completion with Enter (like blink.cmp 'enter' preset)
        ['<CR>'] = cmp.mapping.confirm { select = true },
        -- Tab for snippet navigation
        ['<Tab>'] = cmp.mapping(function(fallback)
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = cmp.config.sources {
        { name = 'lazydev', group_index = 0 }, -- High priority for lazydev (like score_offset = 100)
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' },
      },
    }
  end,
}
