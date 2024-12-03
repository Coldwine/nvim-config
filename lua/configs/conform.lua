local status, conform = pcall(require, 'conform')

if not status then
  return
end

conform.setup({
  formatters_by_ft = {
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    javascriptreact = { 'prettier' },
    typescriptreact = { 'prettier' },
    svelte = { 'prettier' },
    css = { 'prettier' },
    html = { 'prettier' },
    json = { 'prettier' },
    yaml = { 'prettier' },
    markdown = { 'prettier' },
    graphql = { 'prettier' },
    lua = { 'stylua' },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
  },
})

vim.keymap.set({ 'n', 'v' }, '<leader>ft', function()
  conform.format({ lsp_fallback = true, async = false })
end, { desc = 'Format file or range (in visual mode)' })
