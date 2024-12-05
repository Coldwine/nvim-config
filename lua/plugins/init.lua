return {
  {
    'folke/noice.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    enabled = true,
    config = function()
      require('configs.noice')
    end,
  },
  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
    config = function()
      require('configs.treesitter')
    end,
    dependencies = { 'windwp/nvim-ts-autotag' },
  },
  { 'windwp/nvim-ts-autotag', lazy = true },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('configs.lsp')
    end,
  },

  -- Mason: Portable package manager
  {
    'williamboman/mason.nvim',
    config = function()
      require('configs.mason')
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('configs.mason-lsp')
    end,
  },

  -- Terminal
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('configs.toggleterm')
    end,
  },

  -- Markdown Preview
  {
    'iamcco/markdown-preview.nvim',
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
}
