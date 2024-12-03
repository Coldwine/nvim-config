local status, neotree = pcall(require, 'neo-tree')

if not status then
  return
end

neotree.setup({
  filesystem = {
    filtered_items = {
      visible = true,
    },
    use_libuv_file_watcher = true,
  },
})
