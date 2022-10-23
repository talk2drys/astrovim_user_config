return function()
  local dap = require "dap"
  dap.adapters = {
    lldb = {
      type = "executable",
      command = "/usr/bin/lldb-vscode",
      name = "lldb",
    },
  }

  -- Configuration
  dap.configurations.cpp = {
    {
      name = 'Launch',
      type = 'lldb',
      request = 'launch',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. "/target/debugu" .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      args = {},

    },
  }

  -- If you want to use this for Rust and C, add something like this:
  dap.configurations.c = dap.configurations.cpp
  dap.configurations.rust = dap.configurations.cpp

  -- get notify
  local function start_session(_, _)
    local info_string = string.format("%s", dap.session().config.program)
    vim.notify(info_string, "debug", { title = "Debugger Started", timeout = 500 })
  end

  local function terminate_session(_, _)
    local info_string = string.format("%s", dap.session().config.program)
    vim.notify(info_string, "debug", { title = "Debugger Terminated", timeout = 500 })
  end
  
  dap.listeners.after.event_initialized["dapui"] = start_session
  dap.listeners.before.event_terminated["dapui"] = terminate_session
  -- Define symbols
  vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticWarn" })
  vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticInfo" })
  vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticError" })
  vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DiagnosticInfo" })
  vim.fn.sign_define("DapLogPoint", { text = ".>", texthl = "DiagnosticInfo" })
end