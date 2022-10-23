-- alternatively you can override the default configs
return {
  ui = {
    border = "rounded",
    notification_style = "plugin",
  },
  decorations = {
    statusline = {
      app_version = true,
      device = false,
    },
  },
  widget_guides = {
    enabled = true,
  },
  closing_tags = {
    highlight = "Comment", -- highlight for the closing tag
    prefix = "> ", -- character to use for close tag e.g. > Widget
    enabled = true, -- set to false to disable
  },
  fvm = false,
  dev_log = {
    enabled = true,
    open_cmd = "tabedit", -- command to use to open the log buffer
  },
  dev_tools = {
    autostart = true, -- autostart devtools server if not detected
    auto_open_browser = true, -- Automatically opens devtools in the browser
  },
  outline = {
    open_cmd = "30vnew", -- command to use to open the outline buffer
    auto_open = false, -- if true this will open the outline automatically when it is first populated
  },
  lsp = astronvim.lsp.server_settings "dartls"
}

