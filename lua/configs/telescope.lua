local status, telescope = pcall(require, 'telescope')
if not status then return end

local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

local border = {
  prompt = { '─', '│', '─', '│', '┌', '┐', '┴', '└' },
  results = { '─', '│', '─', '│', '┌', '┬', '┤', '├' },
  preview = { '─', '│', '─', ' ', '─', '┐', '┘', '─' },
}
local layout_strategies = require('telescope.pickers.layout_strategies')
layout_strategies.horizontal_fused = function(picker, max_columns, max_lines, layout_config)
  local layout = layout_strategies.horizontal(picker, max_columns, max_lines, layout_config)
  layout.prompt.title = ''
  layout.results.title = ''
  layout.results.height = layout.results.height + 1
  layout.results.borderchars = border.results
  layout.prompt.borderchars = border.prompt
  if layout.preview then
    layout.preview.title = ''
    layout.preview.borderchars = border.preview
  end
  return layout
end

telescope.setup({
  defaults = {
    layout_strategy = 'horizontal_fused',
    sorting_strategy = 'ascending',
    prompt_prefix = '   ',
    entry_prefix = '   ',
    multi_icon = '  ',
    selection_caret = '  ',
    results_title = '',
    prompt_title = ' prompt ',
    file_ignore_patterns = {
      '**\\*.xlsx',
      '**\\*.png',
      '**\\*.jpg',
      '**\\*.jpeg',
      '**\\*.pdf',
      '**\\*.zip',
      '**\\*.docx',
    },
    preview = true,
    mappings = {
      n = {
        ['d'] = actions.delete_buffer,
        ['q'] = actions.close,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
    whaler = {
      oneoff_directories = { '~/Workspace/app', '~/.config/nvim', '~/.config/tmux', '~/.config/kitty' },
      auto_file_explorer = false,
      file_explorer = 'neotree',
      theme = {
        layout_strategy = 'horizontal_fused',
        previewer = true,
        layout_config = {
          width = 0.8,
          height = 0.8,
          preview_cutoff = 1,
          horizontal_fused = {
            width = 0.8,
            height = 0.8,
            preview_cutoff = 1,
          },
        },
      },
    },
  },
})

-- Load extensions in a loop
for _, ext in ipairs({ 'fzf', 'whaler', 'noice' }) do
  telescope.load_extension(ext)
end

local mappings = {
  ['<c-p>'] = { func = builtin.find_files, desc = 'Find files' },
  ['<leader>/'] = { func = builtin.live_grep, desc = 'Live grep' },
  ['<leader><enter>'] = { func = builtin.buffers, desc = 'List buffers' },
  ['<leader>fw'] = {
    func = telescope.extensions.whaler.whaler,
    desc = 'Whaler file explorer with custom layout',
  },
  ['<leader>fh'] = { func = builtin.help_tags, desc = 'Find help tags' },
  ['<leader>fs'] = { func = builtin.git_status, desc = 'Git status' },
  ['<leader>fc'] = { func = builtin.git_commits, desc = 'Git commits' },
  ['<leader>dw'] = { func = function() builtin.diagnostics({ bufnr = 0 }) end, desc = 'Diagnostics (current buffer)' },
}
for key, map in pairs(mappings) do
  vim.keymap.set('n', key, map.func, { silent = true, desc = map.desc })
end
