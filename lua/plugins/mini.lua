return {
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.diff').setup {}
      require('mini.git').setup {}
      require('mini.icons').setup {}
      require('mini.statusline').setup {}
    end,
  },
}
