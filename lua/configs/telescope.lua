local status, telescope = pcall(require, 'telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

if not status then
  return
end

local border = {
  prompt = { '─', '│', ' ', '│', '╭', '╮', '│', '│' },
  results = { '─', '│', '─', '│', '├', '┤', '╯', '╰' },
  preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
}
local layout_config = {
  preview_cutoff = 10,
  height = 0.6,
  anchor = 'S',
  mirror = false,
  prompt_position = 'top',
  width = { padding = 0 },
}

telescope.setup({
  defaults = {
    layout_strategy = 'center',
    layout_config = layout_config,
    sorting_strategy = 'ascending',
    prompt_prefix = '   ',
    entry_prefix = '   ',
    multi_icon = '  ',
    selection_caret = '  ',
    border = true,
    borderchars = border,
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
  pickers = {
    find_files = {
      theme = 'dropdown',
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
      directories = { '~/Workspace', { path = '/home/coldwine/Workspace', alias = 'work' } },
      oneoff_directories = { '~/.config/nvim' },
      auto_file_explorer = false,
      file_explorer = 'neotree',
    },
  },
})

telescope.load_extension('fzf')
telescope.load_extension('whaler')
telescope.load_extension('noice')

local opts = { silent = true }

vim.keymap.set('n', '<c-p>', builtin.find_files, opts)
vim.keymap.set('n', '<leader>/', builtin.live_grep, opts)
vim.keymap.set('n', '<leader><enter>', builtin.buffers, opts)
vim.keymap.set('n', '<leader>fw', telescope.extensions.whaler.whaler, opts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)
vim.keymap.set('n', '<leader>fs', builtin.git_status, opts)
vim.keymap.set('n', '<leader>fc', builtin.git_commits, opts)
