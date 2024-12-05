local function map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { silent = true })
end

-- Utils
map('v', '<', '<gv')
map('v', '>', '>gv')
map('n', ' ', '')
map('n', '<bs>', '<cmd>set hlsearch! hlsearch?<CR>')

-- Save
map('n', '<leader>w', '<CMD>update<CR>')

-- Quit
map('n', '<leader>q', '<CMD>q<CR>')

-- Smash escape and unbind arrow keys
map('i', 'jk', '<ESC>')
map('i', '<left>', '<NOP>')
map('i', '<right>', '<NOP>')
map('i', '<up>', '<NOP>')
map('i', '<down>', '<NOP>')

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
