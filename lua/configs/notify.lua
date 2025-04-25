local status, notify = pcall(require, 'notify')
if not status then return end

notify.setup({
  render = 'simple',
  on_open = function(win)
    local config = vim.api.nvim_win_get_config(win)
    local new_config = vim.tbl_extend('force', config, { border = 'single' })
    vim.api.nvim_win_set_config(win, new_config)
  end,
})
