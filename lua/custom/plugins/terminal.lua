return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<leader>tt]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = false,  -- Disable shading for better colors
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = 'horizontal',
      close_on_exit = true,
      shell = vim.o.shell,
      highlights = {
        Normal = {
          link = 'Normal'
        },
        NormalFloat = {
          link = 'Normal'
        },
      },
      -- Enable true terminal colors
      env = {
        TERM = "xterm-256color"
      },
    })

    -- Custom terminal keymaps
    function _G.set_terminal_keymaps()
      local opts = {buffer = 0}
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    end

    -- Auto-command to set terminal keymaps when terminal opens
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
  end
} 