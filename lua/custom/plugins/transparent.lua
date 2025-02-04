return {
  'xiyaowong/transparent.nvim',
  config = function()
    require('transparent').setup {
      extra_groups = { -- add any existing groups that should be transparent
        'NormalFloat',
        'NvimTreeNormal',
        'NeoTreeNormal',
        'TelescopeNormal',
      },
    }
    vim.cmd [[TransparentEnable]]
  end,
}

