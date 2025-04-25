local ok, conform = pcall(require, 'conform')
if not ok then return end

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
  format_on_save = { lsp_format = 'fallback', timeout_ms = 500 },
})

vim.keymap.set(
  { 'n', 'v' },
  '<leader>ft',
  function() conform.format({ lsp_format = 'fallback', timeout_ms = 500 }) end,
  { desc = 'Format file or range (in visual mode)' }
)
