return {
  -- Noice: Enhanced UI
  {
    'folke/noice.nvim',
    dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' },
    config = function() require('configs.noice') end,
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    config = function() require('configs.treesitter') end,
    dependencies = { 'windwp/nvim-ts-autotag' },
  },
  { 'windwp/nvim-ts-autotag', lazy = true },

  -- LSP and Mason
  {
    'neovim/nvim-lspconfig',
    config = function() require('configs.lsp') end,
  },
  {
    'williamboman/mason.nvim',
    config = function() require('configs.mason') end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function() require('configs.mason-lsp') end,
  },

  -- Terminal
  {
    'akinsho/toggleterm.nvim',
    config = function() require('configs.toggleterm') end,
  },

  -- Tmux Navigator
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
      'TmuxNavigatorProcessList',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },

  -- Markdown Preview
  {
    'iamcco/markdown-preview.nvim',
    build = function() vim.fn['mkdp#util#install']() end,
  },

  -- Syntax plugins
  { 'fladson/vim-kitty', ft = 'kitty' },
}
