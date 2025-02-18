-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Add transparency support
  { import = 'custom.plugins.transparent' },

  -- Add enhanced command-line (noice.nvim) support for a nice container
  { import = 'custom.plugins.noice' },

  -- Add database support with vim-dadbod
  { import = 'custom.plugins.dadbod' },

  -- Add a cursor composer agent like alternative in NVIM
  { import = 'custom.plugins.avante' },
}
