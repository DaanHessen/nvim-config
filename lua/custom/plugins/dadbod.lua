return {
  'tpope/vim-dadbod',
  dependencies = {
    'kristijanhusak/vim-dadbod-ui',
    'kristijanhusak/vim-dadbod-completion',
  },
  cmd = {
    'DBUIToggle',
    'DBUI',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = vim.g.have_nerd_font
    vim.g.db_ui_show_database_icon = vim.g.have_nerd_font
    vim.g.db_ui_force_echo_notifications = true
    vim.g.db_ui_win_position = 'left'
    vim.g.db_ui_winwidth = 30

    -- Add keyboard shortcut for toggling UI
    vim.keymap.set('n', '<leader>db', '<Cmd>DBUIToggle<CR>', { desc = 'Toggle DB UI' })
    vim.keymap.set('n', '<leader>df', '<Cmd>DBUIFindBuffer<CR>', { desc = 'Find DB Buffer' })
    vim.keymap.set('n', '<leader>dr', '<Cmd>DBUIRenameBuffer<CR>', { desc = 'Rename DB Buffer' })
    vim.keymap.set('n', '<leader>dl', '<Cmd>DBUILastQueryInfo<CR>', { desc = 'Last Query Info' })
  end,
  config = function()
    -- Enable vim-dadbod-completion in sql files
    vim.api.nvim_create_autocmd('FileType', {
      pattern = {
        'sql',
        'mysql',
        'plsql',
      },
      callback = function()
        require('cmp').setup.buffer({
          sources = {
            { name = 'vim-dadbod-completion' },
            { name = 'buffer' },
            { name = 'luasnip' },
          },
        })
      end,
    })
  end,
} 