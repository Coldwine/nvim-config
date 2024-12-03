local function map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { silent = true })
end

local status, telescope = pcall(require, 'telescope.builtin')

if status then
  -- Telescope
  map('n', '<c-p>', telescope.find_files)
  map('n', '<Leader>/', telescope.live_grep)
  map('n', '<Leader><Enter>', telescope.buffers)
  map('n', '<Leader>fh', telescope.help_tags)
  map('n', '<Leader>fs', telescope.git_status)
  map('n', '<Leader>fc', telescope.git_commits)
else
  print('Telescope not found')
end

-- Utils
map('v', '<', '<gv')
map('v', '>', '>gv')
map('n', ' ', '')
map('n', '<BS>', '<CMD>set hlsearch! hlsearch?<CR>')

-- Save
map('n', '<leader>w', '<CMD>update<CR>')

-- Quit
map('n', '<leader>q', '<CMD>q<CR>')

-- Smash escape and unbind arrow keys
map('i', 'jk', '<ESC>')
map('i', 'ESC', '<NOP>')
map('i', 'Left', '<NOP>')
map('i', 'Right', '<NOP>')
map('i', 'Up', '<NOP>')
map('i', 'Down', '<NOP>')

-- Windows
map('n', '<leader>n', '<CMD>vsplit<CR>')
map('n', '<leader>p', '<CMD>split<CR>')

-- NeoTree
map('n', '<leader>e', '<CMD>Neotree toggle right<CR>')
map('n', '<leader>o', '<CMD>Neotree focus<CR>')

-- Buffer
map('n', '<TAB>', '<CMD>bnext<CR>')
map('n', '<S-TAB>', '<CMD>bprevious<CR>')

-- Terminal
map('n', '<leader>tt', '<CMD>ToggleTerm<CR>')
map('n', '<leader>th', '<CMD>ToggleTerm size=10 direction=horizontal<CR>')
map('n', '<leader>tv', '<CMD>ToggleTerm size=80 direction=vertical<CR>')

-- Window Navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-j>', '<C-w>j')

-- Resize Windows
map('n', '<C-Left>', '<C-w><')
map('n', '<C-Right>', '<C-w>>')
map('n', '<C-Up>', '<C-w>+')
map('n', '<C-Down>', '<C-w>-')
