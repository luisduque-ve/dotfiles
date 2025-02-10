return {
  "mfussenegger/nvim-dap",
  cond = not vim.g.vscode,
  event = "VeryLazy",
  init = function()
    local dap = require("dap")
    dap.set_log_level("TRACE")
  end,
  config = function()
    local sign = vim.fn.sign_define
    local dap = require("dap")
    dap.defaults.fallback.terminal_win_cmd = "tabnew"
    sign("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    sign("DapBreakpointCondition", { text = "", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
    sign("DapLogPoint", { text = "", texthl = "DapLogPoint", linehl = "", numhl = "" })
    sign("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })

    -- This follows the vscode style as much as possible, to ease
    -- work in a vscode environment when needed
    vim.keymap.set("n", "<F5>", dap.continue, { desc = "continue" })
    vim.keymap.set("n", "<F7>", function()
      dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end, { desc = "log_point" })
    vim.keymap.set("n", "<F8>", function()
      dap.set_breakpoint(vim.fn.input("Condition: "), nil, nil)
    end, { desc = "conditional_point" })
    vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "breakpoint" })
    vim.keymap.set({ "n", "i" }, "<F10>", function()
      dap.step_over()
    end, { desc = "step_over" })
    vim.keymap.set({ "n", "i" }, "<F11>", function()
      dap.step_into()
    end, { desc = "into" })
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dap.repl.open({
        height = 10,
      })
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dap.repl.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      print("dap exited")
    end
  end,
}
