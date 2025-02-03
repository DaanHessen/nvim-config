-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  -- Optional dependency
  dependencies = { 'hrsh7th/nvim-cmp' },
  config = function()
    require('nvim-autopairs').setup {
      check_ts = true, -- Enable treesitter integration
      enable_abbr = true, -- Enable abbreviation expansion
      html_style = {
        -- Use default HTML tag pairs (covers all standard elements)
        -- https://github.com/windwp/nvim-autopairs/blob/master/lua/nvim-autopairs/rules/html.lua
        'default' 
      },
      fast_wrap = {
        map = '<M-e>', -- Add wrap shortcut
      }
    }
    -- Integration with completion
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local cmp = require 'cmp'
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end,
}
