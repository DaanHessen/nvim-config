return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    cmdline = {
      enabled = true,
      view = "cmdline", -- use the simple cmdline view
      format = {
        cmdline = { pattern = "^:", icon = "", lang = "vim" },
        search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
        search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
        filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
        lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
        help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖" },
      },
    },
    messages = {
      enabled = true,
      view = "notify",
      view_error = "notify",
      view_warn = "notify",
      view_history = "messages",
      view_search = false,
    },
    popupmenu = {
      enabled = false, -- disable the noice popupmenu
    },
    -- Overrides help improve markdown rendering in LSP messages.
    overrides = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    presets = {
      bottom_search = true,         -- use a classic bottom cmdline for search
      command_palette = false,      -- disable command palette
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = true,           -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true,       -- add a border to hover docs and signature help
    },
    routes = {
      -- Skip displaying certain message types
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
    },
  },
  config = function(_, opts)
    require("noice").setup(opts)
    
    -- Add keymaps for Noice history navigation
    vim.keymap.set("n", "<leader>nl", function()
      require("noice").cmd("last")
    end, { desc = "Noice Last Message" })
    
    vim.keymap.set("n", "<leader>nh", function()
      require("noice").cmd("history")
    end, { desc = "Noice History" })
    
    vim.keymap.set("n", "<leader>na", function()
      require("noice").cmd("all")
    end, { desc = "Noice All" })
  end,
} 