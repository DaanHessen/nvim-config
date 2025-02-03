return {
  'gelguy/wilder.nvim',
  event = 'CmdlineEnter',
  config = function()
    local wilder = require('wilder')
    wilder.setup({
      modes = {':', '/', '?'},  -- Enable for command and search modes
      next_key = '<Tab>',      -- Use tab to accept completion
      prev_key = '<S-Tab>',    -- Use shift-tab to go back
      accept_key = '<Right>',  -- Also accept with right arrow
      reject_key = '<Left>',   -- Reject with left arrow
    })

    -- Enable fuzzy completion and use nvim-cmp's sorting
    wilder.set_option('pipeline', {
      wilder.branch(
        wilder.cmdline_pipeline({
          fuzzy = 1,
          set_pcre2_pattern = 1,
        }),
        wilder.python_search_pipeline({
          pattern = wilder.python_fuzzy_pattern(),
          sorter = wilder.python_difflib_sorter(),
          engine = 're',
        })
      ),
    })

    -- Use simple renderer at bottom of screen
    wilder.set_option('renderer', wilder.renderer_mux({
      [':'] = wilder.popupmenu_renderer({
        highlighter = wilder.basic_highlighter(),
        left = {' ', wilder.popupmenu_devicons()},
        right = {' ', wilder.popupmenu_scrollbar()},
        pumblend = 20,
        min_width = '100%',
        min_height = '0%',
        max_height = '20%',
        border = 'none',
        prompt_position = 'bottom',
      }),
      ['/'] = wilder.wildmenu_renderer({
        highlighter = wilder.basic_highlighter(),
      }),
    }))
  end,
} 