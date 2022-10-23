return function()
  local dapui = require "dapui"
  dapui.setup {}

  local dap = require "dap"
  dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
  dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
  dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

  -- DAP mappings:
  local map = vim.api.nvim_set_keymap
  map("n", "<f5>", ":lua require('dap').continue()<cr>", { desc = "Continue" })
  map("n", "<f10>", ":lua require('dap').step_over()<cr>", { desc = "Step over" })
  map("n", "<f11>", ":lua require('dap').step_into()<cr>", { desc = "Step into" })
  map("n", "<f12>", ":lua require('dap').step_out()<cr>", { desc = "Step out" })
  map("n", "<leader>bp", ":lua require('dap').toggle_breakpoint()<cr>", { desc = "Toggle breakpoint" })
  map(
    "n",
    "<leader>Bp",
    ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
    { desc = "Set conditional breakpoint" }
  )
  map(
    "n",
    "<leader>lp",
    ":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Logpoint message: '))<cr>",
    { desc = "Set logpoint" }
  )
  map("n", "<leader>rp", ":lua require('dap').repl.open()<cr>", { desc = "Open REPL" })
  map("n", "<leader>RR", ":lua require('dap').run_last()<cr>", { desc = "Run last debugged program" })
  map("n", "<leader>XX", ":lua require('dap').terminate()<cr>", { desc = "Terminate program being debugged" })
  map("n", "<leader>du", ":lua require('dap').up()<cr>", { desc = "Up one frame" })
  map("n", "<leader>dd", ":lua require('dap').down()<cr>", { desc = "Down one frame" })
end