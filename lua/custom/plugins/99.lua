return {
  'dancorreia-swe/99',
  branch = 'fix/silent-handle-completion-source',
  config = function()
    local _99 = require '99'

    local cwd = vim.uv.cwd()
    local basename = vim.fs.basename(cwd)

    -- Read model from gitignored file, fallback to default
    local model_file = vim.fn.stdpath 'config' .. '/.99-model'
    local model = ''
    local f = io.open(model_file, 'r')
    if f then
      local content = f:read '*a'
      f:close()
      content = vim.trim(content)
      if content ~= '' then
        model = content
      end
    end

    _99.setup {
      model = model,

      logger = {
        level = _99.DEBUG,
        path = '/tmp/' .. basename .. '.99.debug',
        print_on_error = true,
      },

      completion = {
        source = 'cmp',
      },

      md_files = {
        'AGENT.md',
      },
    }

    vim.keymap.set('n', '<leader>9f', function()
      _99.fill_in_function()
    end, { desc = '[99] Fill in function' })
    vim.keymap.set('n', '<leader>9pf', function()
      _99.fill_in_function_prompt()
    end, { desc = '[99] Fill in function with prompt' })

    vim.keymap.set('v', '<leader>9v', function()
      _99.visual()
    end, { desc = '[99] Visual' })
    vim.keymap.set('v', '<leader>9pv', function()
      _99.visual_prompt()
    end, { desc = '[99] Visual prompt' })

    vim.keymap.set('v', '<leader>9s', function()
      _99.stop_all_requests()
    end, { desc = '[99] Stop all requests' })
  end,
}
