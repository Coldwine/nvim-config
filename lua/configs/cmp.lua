local cmp_status, cmp = pcall(require, 'cmp')
if not cmp_status then return end

local luasnip_status, luasnip = pcall(require, 'luasnip')
if not luasnip_status then return end

local has_words_before = function()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local line = vim.api.nvim_buf_get_lines(0, cursor[1] - 1, cursor[1], true)[1]
    or ''
  return cursor[2] ~= 0 and line:sub(cursor[2], cursor[2]):match('%s') == nil
end

local autopairs_status, cmp_autopairs =
  pcall(require, 'nvim-autopairs.completion.cmp')
if autopairs_status then
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

local lspkind_status, lspkind = pcall(require, 'lspkind')
if not lspkind_status then return end

local border_style = { '┌', '─', '┐', '│', '┘', '─', '└', '│' }
-- Extend lspkind's default icons with custom ones
local custom_kind_icons = {
  Copilot = '', -- Custom icon for Copilot
}
-- Merge lspkind's default icons with custom ones
local kind_icons =
  vim.tbl_extend('force', lspkind.presets.default, custom_kind_icons)

cmp.setup({
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end,
  },
  window = {
    completion = cmp.config.window.bordered({ border = border_style }),
    documentation = cmp.config.window.bordered({ border = border_style }),
  },
  formatting = {
    fields = { 'abbr', 'kind', 'menu' },
    format = lspkind.cmp_format({
      mode = 'symbol', -- Show only icons
      maxwidth = 50, -- Truncate long entries
      ellipsis_char = '...', -- Use ellipsis for truncated entries
      symbol_map = kind_icons, -- Add custom icons
    }),
  },
  mapping = cmp.mapping.preset.insert({
    ['<c-p>'] = cmp.mapping.select_prev_item(), -- Navigate to the previous item
    ['<c-n>'] = cmp.mapping.select_next_item(), -- Navigate to the next item
    ['<c-d>'] = cmp.mapping.scroll_docs(-4), -- Scroll documentation up
    ['<c-f>'] = cmp.mapping.scroll_docs(4), -- Scroll documentation down
    ['<c-space>'] = cmp.mapping.complete(), -- Trigger completion menu
    ['<c-e>'] = cmp.mapping.abort(), -- Abort completion
    ['<cr>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
    ['<tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<s-tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'copilot' },
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'nvim_lua' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'calc' },
  }),
})

-- Configure sources per filetype
cmp.setup.filetype('codecompanion', {
  sources = {
    { name = 'codecompanion' },
    { name = 'buffer' },
    { name = 'path' },
  },
})
