return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>w"] = { ":w<CR>", "Save" },
        ["<leader>q"] = { ":wq<CR>", "Save and Quit" },
      },
    },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    init = function()
      -- Basic keymaps that don't need which-key registration
      -- Undo/Redo
      vim.keymap.set('n', '<C-z>', 'u', { desc = 'Undo', noremap = true })
      vim.keymap.set('n', '<C-y>', '<C-r>', { desc = 'Redo', noremap = true })
      vim.keymap.set('i', '<C-z>', '<C-o>u', { desc = 'Undo', noremap = true })
      vim.keymap.set('i', '<C-y>', '<C-o><C-r>', { desc = 'Redo', noremap = true })

      -- Save shortcuts
      vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = 'Save', noremap = true, silent = true })
      vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a', { desc = 'Save', noremap = true, silent = true })
      vim.keymap.set('v', '<C-s>', '<Esc>:w<CR>gv', { desc = 'Save', noremap = true, silent = true })
    end,
  }
} 