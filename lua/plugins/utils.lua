return {
  {
    'norcalli/nvim-colorizer.lua',
    event = 'VeryLazy',
    config = function()
      require('colorizer').setup({ '*' })
    end,
  },
  {
    'windwp/nvim-autopairs',
    config = function()
      require('configs.autopairs')
    end,
  },
  {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup({})
    end,
  },
}
