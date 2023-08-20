return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	init = function()
		local dap = require("dap")
		dap.set_log_level("TRACE")
	end,
	keys = {
		{ "sC", "<CMD>lua require('dap').run_to_cursor()<CR>", desc = "run_to_cursor" },
		{ "sb", "<CMD>lua require('dap').toggle_breakpoint()<CR>", desc = "breakpoint" },
		{ "sc", "<CMD>lua require('dap').continue()<CR>", desc = "continue" },
		{ "si", "<CMD>lua require('dap').step_into()<CR>", desc = "into" },
		{ "sl", "<CMD>lua require('dap').run_last()<CR>", desc = "run_last" },
		{ "sn", "<CMD>lua require('dap').step_over()<CR>", desc = "step_over" },
		{ "sr", "<CMD>lua require('dap').restart()<CR>", desc = "restart" },
		{ "st", "<CMD>lua require('dap').terminate()<CR>", desc = "terminate" },
		{
			"ss",
			"<CMD>lua require('dap.ui.widgets').centered_float(require('dap.ui.widgets').scopes)<CR>",
			desc = "scopes",
		},
	},
}
