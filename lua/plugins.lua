-- Automatically run: PackerCompile
vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerCompile',
})

return require('packer').startup(function(use)
  -- Packer
  use('wbthomason/packer.nvim')

  -- Common utilities
  use('nvim-lua/plenary.nvim')

  -- Icons
  use('nvim-tree/nvim-web-devicons')

  -- Colorschema
  use({
    'catppuccin/nvim',
    as = 'catppuccin',
    config = function()
      require('configs.catppuccin')
    end,
  })

  -- Statusline
  use({
    'nvim-lualine/lualine.nvim',
    event = 'BufEnter',
    config = function()
      require('configs.lualine')
    end,
    requires = { 'nvim-web-devicons' },
  })

  -- Treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
    config = function()
      require('configs.treesitter')
    end,
  })

  use({ 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' })

  -- Telescope
  use({
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    requires = { 'nvim-lua/plenary.nvim' },
  })

  -- LSP
  use({
    'neovim/nvim-lspconfig',
    config = function()
      require('configs.lsp')
    end,
  })

  use('onsails/lspkind-nvim')
  use({
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    tag = 'v2.*',
    -- install jsregexp (optional!:).
    run = 'make install_jsregexp',
  })

  use({
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('configs.conform')
    end,
  })

  -- cmp: Autocomplete
  use({
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    config = function()
      require('configs.cmp')
    end,
  })

  use('hrsh7th/cmp-nvim-lsp')
  use({ 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp' })
  use({ 'hrsh7th/cmp-buffer', after = 'nvim-cmp' })
  use({ 'hrsh7th/cmp-path', after = 'nvim-cmp' })
  use({ 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' })

  -- Mason: Portable package manager
  use({
    'williamboman/mason.nvim',
    config = function()
      require('configs.mason')
    end,
  })

  use({
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('configs.mason-lsp')
    end,
    after = 'mason.nvim',
  })

  -- File manager
  use({
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('configs.neotree')
    end,
  })

  -- Show colors
  use({
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup({ '*' })
    end,
  })

  -- Terminal
  use({
    'akinsho/toggleterm.nvim',
    tag = '*',
    config = function()
      require('configs.toggleterm')
    end,
  })

  -- Git
  use({
    'lewis6991/gitsigns.nvim',
    config = function()
      require('configs.gitsigns')
    end,
  })
  use({
    'NeogitOrg/neogit',
    requires = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim', 'nvim-telescope/telescope.nvim' },
    config = function()
      require('neogit').setup({})
    end,
  })

  -- Markdown Preview
  use({
    'iamcco/markdown-preview.nvim',
    run = function()
      vim.fn['mkdp#util#install']()
    end,
  })

  -- autopairs
  use({
    'windwp/nvim-autopairs',
    config = function()
      require('configs.autopairs')
    end,
  })

  -- smooth scrolling
  use({
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup({})
    end,
  })
end)
