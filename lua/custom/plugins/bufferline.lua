return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local bufferline = require 'bufferline'
    bufferline.setup()

    vim.keymap.set({ 'n', 'v' }, '<S-h>', '<Cmd>:BufferLineCyclePrev<CR>', { desc = 'Select previous bufferline' })
    vim.keymap.set({ 'n', 'v' }, '<S-l>', '<Cmd>:BufferLineCycleNext<CR>', { desc = 'Select next bufferline' })
    vim.keymap.set({ 'n', 'v' }, '<S-x>', '<Cmd>:bd<CR>', { desc = 'Close Bufferline' })

    vim.keymap.set({ 'n', 'v' }, '<C-h>', function()
      bufferline.move(-1)
    end, { desc = 'Move Tab left' })
    vim.keymap.set({ 'n', 'v' }, '<C-l>', function()
      bufferline.move(1)
    end, { desc = 'Move Tab right' })

    for i = 1, 9 do
      vim.keymap.set('n', '<leader>' .. i, function()
        bufferline.go_to(i, false)
      end)
    end
  end,
}
