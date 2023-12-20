return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	init = function()
		local dap = require("dap")
		dap.set_log_level("TRACE")
	end,
	keys = {
		{ "<leader>dc", "<CMD>lua require('dap').continue()<CR>", desc = "continue" },
		{ "<leader>db", "<CMD>lua require('dap').toggle_breakpoint()<CR>", desc = "breakpoint" },
		{ "<leader>do", "<CMD>lua require('dap').step_over()<CR>", desc = "step_over" },
		{ "<leader>di", "<CMD>lua require('dap').step_into()<CR>", desc = "into" },
		{ "<leader>du", "<CMD>lua require('dap').run_to_cursor()<CR>", desc = "run_to_cursor" },
		{ "<leader>dl", "<CMD>lua require('dap').run_last()<CR>", desc = "run_last" },
	},
}
