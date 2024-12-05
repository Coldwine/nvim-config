local status, neogit = pcall(require, 'neogit')

if not status then
  return
end

neogit.setup({
  kind = 'vsplit', -- opens neogit in a split
  signs = {
    -- { CLOSED, OPENED }
    section = { '', '' },
    item = { '', '' },
    hunk = { '', '' },
  },
  integrations = { diffview = true },
})
