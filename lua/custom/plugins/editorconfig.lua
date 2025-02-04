return {
  "editorconfig/editorconfig-vim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- Ensure EditorConfig works well with fugitive
    vim.g.EditorConfig_exclude_patterns = { 'fugitive://.*' }
  end,
} 