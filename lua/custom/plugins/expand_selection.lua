return {
  'terryma/vim-expand-region',
  keys = {
    { 'v', '<Plug>(expand_region_expand)', mode = 'v', noremap = false },
    { 'v', '<Plug>(expand_region_expand)', mode = 'n', noremap = false },
    { 'V', '<Plug>(expand_region_shrink)', mode = 'v', noremap = false }
  },
  config = function()
    vim.g.expand_region_text_objects = {
      ['iw'] = 1, ['iW'] = 1, ['i"'] = 1, ["i'"] = 1, ['i`'] = 1,
      ['i)'] = 1, ['i]'] = 1, ['i}'] = 1, ['ip'] = 1, ['it'] = 1,
      ['a)'] = 1, ['a]'] = 1, ['a}'] = 1, ['al'] = 1, ['il'] = 1
    }
  end
} 