---@type vim.keymap.set.Opts
local o = { noremap = true, nowait = true }

return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      local t = require 'telescope'
      local b = require 'telescope.builtin'

      t.setup {
        pickers = {
          find_files = { theme = 'ivy' },
          help_tags  = { theme = 'dropdown' },
        },
        extensions = { fzf = {} },
      }

      t.load_extension 'fzf'

      vim.keymap.set('n', "<Space>'", '<Nop>', o)
      vim.keymap.set('n', "<Space>'f", b.find_files, o)
      vim.keymap.set('n', "<Space>'g", b.live_grep, o)
      vim.keymap.set('n', "<Space>'b", b.buffers, o)
      vim.keymap.set('n', "<Space>'h", b.help_tags, o)
      vim.keymap.set('n', "<Space>'m", b.marks, o)
      vim.keymap.set('n', "<Space>'j", b.jumplist, o)
      vim.keymap.set('n', "<Space>'k", b.keymaps, o)
      vim.keymap.set('n', "<Space>'s", b.git_status, o)
      vim.keymap.set('n', "<Space>'c", b.git_bcommits, o)

      local m = require 'config.telescope.multigrep-picker'

      vim.keymap.set('n', "<Space>'l", m.live_multigrep, o)
    end,
  },
}
