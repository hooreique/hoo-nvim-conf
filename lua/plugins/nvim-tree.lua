return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local api = require 'nvim-tree.api'

    require('nvim-tree').setup {
      filters = { git_ignored = false },
      hijack_netrw = false,
      renderer = { group_empty = true },

      ---@param bufnr integer
      on_attach = function(bufnr)
        ---@param desc string
        ---@return vim.keymap.set.Opts
        local function o(desc)
          return {
            buffer = bufnr,
            desc = 'hoo: nvim-tree: local: ' .. desc,
            noremap = true,
            nowait = true,
          }
        end

        vim.keymap.set('n', '/', api.tree.toggle_help, o 'Help')
        vim.keymap.set('n', '?', api.tree.toggle_help, o 'Help')
        vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, o 'Open')
        vim.keymap.set('n', '<Right>', api.node.open.edit, o 'Open')
        vim.keymap.set('n', '<CR>', api.node.open.edit, o 'Open')
        vim.keymap.set('n', '<Left>', api.node.navigate.parent, o 'Parent Dir')
        vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, o 'Close Dir')
        vim.keymap.set('n', '-', api.tree.collapse_all, o 'Collapse All')

        vim.keymap.set('n', 'h', '0', o 'Horizontal Scroll Left Most')
        vim.keymap.set('n', 'o', '$', o 'Horizontal Scroll Right Most')

        vim.keymap.set('n', 't', api.node.open.edit, o 'Open')
        vim.keymap.set('n', 'r', api.node.navigate.parent_close, o 'Close Dir')
      end,
    }

    vim.keymap.set('n', '`', function()
      if api.tree.is_visible() then
        api.tree.close()
      else
        api.tree.open()
        vim.cmd.wincmd 'p'
      end
    end, {
      noremap = true,
      nowait = true,
      desc = 'hoo: nvim-tree: Toggle',
    })
  end,
}
