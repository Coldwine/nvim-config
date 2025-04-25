local status, neogit = pcall(require, 'neogit')
if not status then return end

neogit.setup({
  kind = 'vsplit', -- opens neogit in a split
  signs = {
    section = { '', '' },
    item = { '', '' },
    hunk = { '', '' },
  },
  integrations = { diffview = true },
})
