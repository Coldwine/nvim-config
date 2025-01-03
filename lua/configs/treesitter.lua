local status, ts = pcall(require, 'nvim-treesitter.configs')

if not status then
  return
end

ts.setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  ensure_installed = {
    'bash',
    'css',
    'html',
    'javascript',
    'json',
    'lua',
    'markdown',
    'markdown_inline',
    'regex',
    'rust',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'yaml',
  },
  rainbow = {
    enable = true,
    disable = { 'html' },
    extended_mode = false,
    max_file_lines = nil,
  },
  autotag = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = true },
})

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.tsx.filetype_to_parsername = { 'javascript', 'typescript.tsx' }
