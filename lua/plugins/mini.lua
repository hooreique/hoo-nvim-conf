return {
  {
    'echasnovski/mini.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('mini.icons').setup {}

      require('mini.comment').setup {
        mappings = {
          -- Toggle comment for both Normal and Visual modes
          comment = '',
          -- Toggle comment on current line
          comment_line = '/',
          -- Toggle comment on visual selection
          comment_visual = '/',
          -- Define 'comment' textobject
          -- Works also in Visual mode if mapping differs from `comment_visual`
          textobject = '/',
        }
      }

      require('mini.tabline').setup {}

      require('mini.statusline').setup {}
    end,
  },
}
