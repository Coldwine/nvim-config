local status, noice = pcall(require, 'noice')

if not status then
  return
end

local rounded_border_style = {
  top_left = '╭',
  top = '─',
  top_right = '╮',
  left = '│',
  right = '│',
  bottom_left = '╰',
  bottom = '─',
  bottom_right = '╯',
}

noice.setup({
  cmdline = {
    enabled = true,
    view = 'cmdline_popup',
    opts = {},
    format = {
      cmdline = { pattern = '^:', icon = '', lang = 'vim', title = ' Command ' },
      search_down = { kind = 'search', pattern = '^/', icon = '  ', lang = 'regex', title = ' Search Down ' },
      search_up = { kind = 'search', pattern = '^%?', icon = '  ', lang = 'regex', title = ' Search Up ' },
      filter = { pattern = '^:%s*!', icon = '  ', lang = 'bash', title = ' Filter ' },
      lua = {
        pattern = { '^:%s*lua%s+', '^:%s*lua%s*=%s*', '^:%s*=%s*' },
        icon = '  ',
        lang = 'lua',
        title = ' Lua ',
      },
      help = { pattern = '^:%s*he?l?p?%s+', icon = ' 󰋖', title = ' Help ' },
      input = {},
    },
  },
  message = {
    enabled = true,
    view = 'mini',
    view_error = 'notify',
    view_warn = 'notify',
    view_history = 'message',
    view_search = 'virtualtext',
  },
  popup_menu = {
    enabled = true,
    backend = 'cmp',
    kind_icons = {},
  },
  redirect = {
    view = 'popup',
    filter = { event = 'msg_show' },
  },
  command = {
    history = {
      view = 'split',
      opts = { enter = true, format = 'details' },
      filter = {
        any = {
          { event = 'notify' },
          { error = true },
          { warning = true },
          { event = 'msg_show', kind = { '' } },
          { event = 'lsp', kind = 'message' },
        },
      },
    },
    last = {
      view = 'popup',
      opts = { enter = true, format = 'details' },
      filter = {
        any = {
          { event = 'notify' },
          { error = true },
          { warning = true },
          { event = 'msg_show', kind = { '' } },
          { event = 'lsp', kind = 'message' },
        },
      },
      filter_opts = { count = 1 },
    },
    errors = {
      view = 'popup',
      opts = { enter = true, format = 'details' },
      filter = { error = true },
      filter_opts = { reverse = true },
    },
  },
  notify = {
    enabled = true,
    view = 'notify',
  },
  lsp = {
    progress = {
      enabled = true,
      format = 'lsp_progress',
      format_done = 'lsp_progress_done',
      view = 'mini',
      throttle = 1000 / 30,
    },
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
    },
    hover = {
      enabled = true,
      view = nil,
      opts = {},
    },
    signature = {
      enabled = true,
      auto_open = {
        enabled = true,
        trigger = true,
        luasnip = true,
        throttle = 50,
      },
      view = nil,
      opts = {},
    },
    message = {
      enabled = true,
      view = 'mini',
      opts = {},
    },
    documentation = {
      view = 'hover',
      opts = {
        lang = 'markdown',
        replace = true,
        render = 'plain',
        format = { '{message}' },
        win_options = { concealcursor = 'n', conceallevel = 3 },
      },
    },
  },
  markdown = {
    hover = {
      ['|(%S-)|'] = vim.cmd.help,
      ['%[.-%]%((%S-)%)'] = require('noice.util').open,
    },
    highlights = {
      ['|%S-|'] = '@text.reference',
      ['@%S+'] = '@parameter',
      ['^%s*(Parameters:)'] = '@text.title',
      ['^%s*(Return:)'] = '@text.title',
      ['^%s*(See also:)'] = '@text.title',
      ['{%S-}'] = '@parameter',
    },
  },
  smart_move = {
    enabled = true,
    excluded_filetype = { 'cmp-menu', 'cmp_docs', 'notify' },
  },
  presets = {
    bottom_search = false,
    command_palette = false,
    long_message_to_split = false,
    inc_rename = false,
    lsp_doc_border = true,
  },
  throttle = 1000 / 30,
  views = {
    cmdline_popup = {
      position = {
        row = '50%',
        col = '50%',
      },
      size = {
        width = '40%',
        height = 'auto',
      },
      border = {
        style = rounded_border_style,
        -- style = "none",
      },
      filter_options = {},
      win_options = {
        winhighlight = { Normal = 'TelescopePromptNormal', FloatBorder = 'DiagnosticInfo' },
      },
    },
    split = {
      enter = true,
    },
    notify = {
      size = {
        width = 30,
      },
    },
    mini = {
      win_options = {
        winblend = 0,
      },
    },
    popupmenu = {
      relative = 'editor',
      position = {
        row = 8,
        col = '50%',
      },
      size = {
        width = 60,
        height = 10,
      },
      border = {
        style = rounded_border_style,
        padding = { 0, 1 },
      },
      win_options = {
        winhighlight = { Normal = 'TelescopePromptNormal', FloatBorder = 'DiagnosticInfo' },
      },
    },
  },
  routes = {
    {
      filter = {
        event = 'msg_show',
        -- kind = "search_count",
        find = 'written',
      },
      opts = { skip = true },
    },
  },
})
