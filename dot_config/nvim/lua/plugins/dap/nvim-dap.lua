return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	init = function()
		local dap = require("dap")
		dap.set_log_level("TRACE")
	end,
	keys = {
		-- This follows the vscode style as much as possible, to easy
		-- work in a vscode environment when needed
		{ "<F5>", "<CMD>lua require('dap').continue()<CR>", desc = "continue" },
		{ "<F9>", "<CMD>lua require('dap').toggle_breakpoint()<CR>", desc = "breakpoint" },
		{ "<F10>", "<CMD>lua require('dap').step_over()<CR>", desc = "step_over" },
		{ "<F11>", "<CMD>lua require('dap').step_into()<CR>", desc = "into" },
	},
}
