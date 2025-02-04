return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Tree" },
  },
  config = function()
    require("nvim-tree").setup({
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      view = {
        width = 30,
        side = "left",
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
      actions = {
        open_file = {
          quit_on_open = false,
          window_picker = {
            enable = true,
          },
        },
        change_dir = {
          enable = true,
          global = false,
        },
      },
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        
        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- Default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- Custom mappings
        vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
        vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
        
        -- Automatically create parent directories when saving new files
        vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = "*",
          callback = function()
            local file = vim.fn.expand("%")
            if file:match("^%s*$") then return end
            local dir = vim.fn.fnamemodify(file, ":p:h")
            if vim.fn.isdirectory(dir) == 0 then
              vim.fn.mkdir(dir, "p")
            end
          end,
        })
      end,
    })

    -- Auto close if it's the last window
    vim.api.nvim_create_autocmd("BufEnter", {
      nested = true,
      callback = function()
        if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
          vim.cmd "quit"
        end
      end
    })
  end,
} 