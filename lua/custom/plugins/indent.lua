return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      indent = {
        char = '│',
        tab_char = '│',
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          'help',
          'alpha',
          'dashboard',
          'neo-tree',
          'Trouble',
          'trouble',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'lazyterm',
        },
      },
    },
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {
      check_ts = true,
      ts_config = {
        lua = {'string'},
        javascript = {'template_string'},
        java = false,
      },
      disable_filetype = { "TelescopePrompt", "spectre_panel" },
      fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = [=[[%'%"%)%>%]%)%}%,]]=],
        offset = 0,
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'PmenuSel',
        highlight_grey = 'LineNr',
      },
      enable_check_bracket_line = true,
      ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
      enable_afterquote = true,  -- add bracket pairs after quote
      enable_moveright = true,
      map_bs = true,  -- map the <BS> key
      map_c_h = true,  -- Map the <C-h> key to delete a pair
      map_c_w = true,  -- map <c-w> to delete a pair if possible
    },
    config = function(_, opts)
      local npairs = require('nvim-autopairs')
      npairs.setup(opts)
      
      -- Integration with completion engine
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )

      -- Add spaces between parentheses
      local Rule = require('nvim-autopairs.rule')
      npairs.add_rules({
        Rule(' ', ' ')
          :with_pair(function(opts)
            local pair = opts.line:sub(opts.col - 1, opts.col)
            return vim.tbl_contains({ '()', '[]', '{}' }, pair)
          end),
        Rule('( ', ' )')
          :with_pair(function() return false end)
          :with_move(function(opts) return opts.prev_char:match('.%)') ~= nil end)
          :use_key(')'),
        Rule('{ ', ' }')
          :with_pair(function() return false end)
          :with_move(function(opts) return opts.prev_char:match('.%}') ~= nil end)
          :use_key('}'),
        Rule('[ ', ' ]')
          :with_pair(function() return false end)
          :with_move(function(opts) return opts.prev_char:match('.%]') ~= nil end)
          :use_key(']'),
      })
    end,
  },
} 