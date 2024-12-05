local global = vim.g
local o = vim.o

-- Map <leader> = the space key

global.mapleader = ' '
global.maplocalleader = ' '

-- Editor options

o.number = true
o.relativenumber = true
o.clipboard = 'unnamedplus'
o.syntax = 'on'
o.autoindent = true
o.cursorline = true
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.encoding = 'UTF-8'
o.ruler = false
o.mouse = ''
o.title = true
o.hidden = true
o.ttimeoutlen = 0
o.wildmenu = true
o.showcmd = true
o.showmode = false
o.showmatch = true
o.ignorecase = true
o.smartcase = true
o.smartindent = true
o.inccommand = 'split'
o.splitright = true
o.termguicolors = true
o.wrap = false
o.undofile = true
o.signcolumn = 'yes'
o.smoothscroll = true
