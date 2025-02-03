-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Add transparency support
  { import = 'custom.plugins.transparent' },

  -- Add enhanced command-line (noice.nvim) support for a nice container
  { import = 'custom.plugins.noice' },

  -- Add command-line completion with wilder.nvim
  { import = 'custom.plugins.wilder' },

  -- Add database support with vim-dadbod
  { import = 'custom.plugins.dadbod' },
}
