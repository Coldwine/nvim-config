require('luasnip.loaders.from_lua').lazy_load()

-- set keybinds for both INSERT and VISUAL.
vim.keymap.set({ 'i', 's' }, '<C-n>', '<Plug>luasnip-next-choice', {})
vim.keymap.set({ 'i', 's' }, '<C-p>', '<Plug>luasnip-prev-choice', {})
