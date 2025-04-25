local status, masonlsp = pcall(require, 'mason-lspconfig')
if not status then
  vim.notify('Failed to load mason-lspconfig', vim.log.levels.ERROR)
  return
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Default handler for LSP servers
local function default_handler(server_name)
  require('lspconfig')[server_name].setup({
    capabilities = capabilities,
  })
end

-- Lua language server specific configuration
local function lua_ls_handler()
  require('lspconfig').lua_ls.setup({
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME,
            '${3rd}/luv/library',
            '${3rd}/busted/library',
            '/usr/share/lua',
          },
        },
        diagnostics = {
          globals = { 'vim' },
        },
      },
    },
  })
end

-- Handlers table
local handlers = {
  default_handler,
  ['lua_ls'] = lua_ls_handler,
}

-- Mason LSP setup
masonlsp.setup({
  automatic_installation = true,
  ensure_installed = { 'cssls', 'eslint', 'html', 'jsonls', 'ts_ls', 'lua_ls' },
  handlers = handlers,
})
