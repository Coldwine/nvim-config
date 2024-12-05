return {
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    config = function()
      require('configs.gitsigns')
    end,
  },
  {
    'NeogitOrg/neogit',
    config = function()
      require('configs.neogit')
    end,
    dependencies = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim', 'nvim-telescope/telescope.nvim' },
  },
}
