require('luasnip.loaders.from_lua').lazy_load()

-- set keybinds for both INSERT and VISUAL.
vim.api.nvim_set_keymap({ 'i', 's' }, '<C-n>', '<Plug>luasnip-next-choice', {})
vim.api.nvim_set_keymap({ 'i', 's' }, '<C-p>', '<Plug>luasnip-prev-choice', {})
