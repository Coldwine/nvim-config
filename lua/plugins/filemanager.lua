return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  config = function()
    require('configs.neotree')
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
}
