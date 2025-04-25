local status, catppuccin = pcall(require, 'catppuccin')

if not status then
  return
end

catppuccin.setup({
  flavour = 'latte',
  no_italic = true,
  transparent_background = true,
  integrations = {
    cmp = true,
    gitsigns = true,
    mason = true,
    neotree = true,
    neogit = true,
    treesitter = true,
    noice = true,
    notify = true,
    mini = {
      enabled = true,
      indentscope_color = '',
    },
  },
  show_end_of_buffer = true,
})
