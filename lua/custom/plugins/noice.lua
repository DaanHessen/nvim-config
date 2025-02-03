return {
  "folke/noice.nvim",
  event = "CmdlineEnter", -- load on entering the command-line mode
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {
    cmdline = {
      enabled = true,
      view = "cmdline",   -- use a custom cmdline view (appears in a container)
      opts = {},
    },
    -- Overrides help improve markdown rendering in LSP messages.
    overrides = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    presets = {
      long_message_to_split = true,
      command_palette = true,  -- displays a command palette-style popup
      lsp_doc_border = true,
    },
  },
  config = function(_, opts)
    require("noice").setup(opts)
  end,
} 