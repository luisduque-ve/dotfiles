return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	init = function()
		local dap = require("dap")
		dap.set_log_level("TRACE")
	end,
	keys = {
		{ "<F5>", "<CMD>lua require('dap').continue()<CR>", desc = "continue" },
		{ "<F9>", "<CMD>lua require('dap').toggle_breakpoint()<CR>", desc = "breakpoint" },
		{ "<F10>", "<CMD>lua require('dap').step_over()<CR>", desc = "step_over" },
		{ "<F11>", "<CMD>lua require('dap').step_into()<CR>", desc = "into" },
		{ "<S-F5>", "<CMD>lua require('dap').terminate()<CR>", desc = "terminate" },

		{ "<leader>dC", "<CMD>lua require('dap').run_to_cursor()<CR>", desc = "run_to_cursor" },
		{ "<leader>dl", "<CMD>lua require('dap').run_last()<CR>", desc = "run_last" },
		{ "<leader>dr", "<CMD>lua require('dap').restart()<CR>", desc = "restart" },
		{
			"<leader>ds",
			"<CMD>lua require('dap.ui.widgets').centered_float(require('dap.ui.widgets').scopes)<CR>",
			desc = "scopes",
		},
	},
}
