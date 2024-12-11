return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  config = function()
    require('configs.cmp')
  end,
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-calc',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'TechnicalDC/cmp-abl',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip',
  },
}
