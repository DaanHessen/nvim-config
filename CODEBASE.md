# Kickstart.nvim Codebase Inventory

## Core Plugins (init.lua)

1. **Basic Utilities**
   - `tpope/vim-sleuth` - Automatic indentation detection
   - `lewis6991/gitsigns.nvim` - Git gutter signs
   - `folke/which-key.nvim` - Keybinding hints

2. **Telescope Ecosystem**
   - `nvim-telescope/telescope.nvim` (0.1.x branch)
   - Dependencies:
     - `nvim-lua/plenary.nvim`
     - `nvim-telescope/telescope-fzf-native.nvim`
     - `nvim-telescope/telescope-ui-select.nvim`
     - `nvim-tree/nvim-web-devicons`

3. **LSP Stack**
   - `neovim/nvim-lspconfig`
   - `williamboman/mason.nvim`
   - `williamboman/mason-lspconfig.nvim`
   - `WhoIsSethDaniel/mason-tool-installer.nvim`
   - `j-hui/fidget.nvim` - LSP status
   - `hrsh7th/cmp-nvim-lsp` - LSP completions

4. **Formatting & Linting**
   - `stevearc/conform.nvim` - Autoformatting
   - Preconfigured formatters:
     - Lua: `stylua`

5. **Completion Engine**
   - `hrsh7th/nvim-cmp`
   - Snippet Engine: `L3MON4D3/LuaSnip`
   - Completion Sources:
     - `saadparwaiz1/cmp_luasnip`
     - `hrsh7th/cmp-nvim-lsp`
     - `hrsh7th/cmp-path`

6. **UI & Visual**
   - `folke/tokyonight.nvim` - Colorscheme
   - `folke/todo-comments.nvim` - TODO highlighting
   - `echasnovski/mini.nvim` (Suite):
     - `mini.ai` - Text objects
     - `mini.surround` - Surround operations
     - `mini.statusline` - Minimal statusline

7. **Syntax & Parsing**
   - `nvim-treesitter/nvim-treesitter`
   - Preconfigured parsers:
     - bash, c, diff, html, lua, markdown, vim, etc.

## Optional Plugins (Disabled by Default)

-- require 'kickstart.plugins.debug'
-- require 'kickstart.plugins.indent_line'
-- require 'kickstart.plugins.lint'
-- require 'kickstart.plugins.autopairs'
-- require 'kickstart.plugins.neo-tree'
-- require 'kickstart.plugins.gitsigns'

## Key System Components

1. **Health Checks** (`lua/kickstart/health.lua`)
   - Neovim version validation
   - External executable checks:
     - git, make, unzip, rg

2. **Language Servers**
   - Preconfigured for Lua (`lua_ls`)
   - Mason-managed servers:
     - stylua (formatter)

3. **Keymaps**
   - Core mappings:
     - `<leader>` prefix for custom operations
     - Telescope integrations
     - LSP actions (code actions, rename, etc.)
     - Window navigation

4. **Auto-Commands**
   - Highlight on yank
   - LSP attachment handlers

## External Dependencies (from README)

- Required: git, make, unzip, ripgrep
- Optional: Nerd Font
- Language-specific:
  - npm (TypeScript)
  - go (Golang)
  - python (Python)

## Customization Points

1. `lua/custom/plugins/init.lua` - User plugin entry
2. Color scheme configuration
3. `mini.nvim` module selection
4. LSP server configurations
5. Formatter/Linter configurations
