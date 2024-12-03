local status, catppuccin = pcall(require, 'catppuccin')

if not status then
  return
end

catppuccin.setup({
  flavour = 'latte',
  transparent_background = false,
  integrations = {
    cmp = true,
    treesitter = true,
    mason = true,
    gitsigns = true,
    neotree = true,
  },
})

vim.cmd.colorscheme('catppuccin')
