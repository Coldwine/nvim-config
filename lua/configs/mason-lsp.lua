local status, masonlsp = pcall(require, "mason-lspconfig")

if not status then
  return
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

masonlsp.setup({
  automatic_installation = true,
  ensure_installed = { "cssls", "eslint", "html", "jsonls", "ts_ls", "lua_ls" },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({
        capabilities = capabilities
      })
    end
  }
})
