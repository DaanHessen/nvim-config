return {
  {
    "xiyaowong/transparent.nvim",
    lazy = false, -- Important: avoid lazy loading
    priority = 1000, -- Load this before other plugins
    config = function()
      require("transparent").setup({
        extra_groups = {
          "NormalFloat", -- Make floating windows transparent
          "FloatBorder",
          "CmpPmenu",
          "CmpBorder",
          "TelescopeBorder",
          "TelescopeNormal",
          "TelescopePromptBorder",
          "TelescopeResultsBorder",
          "TelescopePreviewBorder",
          "VertSplit",
          "StatusLine",
          "StatusLineNC",
          "SignColumn",
          "EndOfBuffer",
          "TabLineFill",
          "TabLine",
          "TabLineSel",
          "WinSeparator",
        },
        exclude_groups = {}, -- No exclusions
      })
      -- Enable transparency
      vim.cmd("TransparentEnable")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "CmdlineEnter",
    dependencies = {
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")

      -- Set up floating window options with transparency support
      local window_config = {
        completion = cmp.config.window.bordered({
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
        }),
        documentation = cmp.config.window.bordered({
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
        }),
      }

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "cmdline" },
          { name = "path" },
        }),
        window = window_config,
      })

      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = "buffer" } },
        window = window_config,
      })

      cmp.setup.cmdline("?", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = "buffer" } },
        window = window_config,
      })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      -- Use a specific browser
      vim.g.mkdp_browser = 'firefox' -- or 'chrome'
      -- Auto start preview
      vim.g.mkdp_auto_start = 1
      -- Auto refresh preview
      vim.g.mkdp_refresh_slow = 0
      -- Set preview theme
      vim.g.mkdp_theme = 'dark'
      -- Key mappings
      vim.keymap.set('n', '<C-p>', '<Plug>MarkdownPreviewToggle', { silent = true })
    end,
  },
} 