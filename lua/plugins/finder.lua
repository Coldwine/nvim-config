return {
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.*',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('configs.telescope')
    end,
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
  },
  'SalOrak/whaler',
}
