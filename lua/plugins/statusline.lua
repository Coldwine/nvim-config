return {
  'nvim-lualine/lualine.nvim',
  event = 'BufEnter',
  config = function()
    require('configs.lualine')
  end,
  dependencies = { 'nvim-web-devicons' },
}
