return {
	"rcarriga/nvim-dap-ui",
	-- I'm mostly debugging python at the moment
	event = "BufEnter *.py",
	dependencies = {
		"mfussenegger/nvim-dap",
		"rcarriga/cmp-dap",
	},
	config = function()
		-- UI config, configs taken from :h dapui.setup()
		local dap, dapui = require("dap"), require("dapui")
		dapui.setup({
			controls = {
				enabled = false,
			},
			element_mappings = {},
			expand_lines = true,
			floating = {
				border = "single",
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
			force_buffers = true,
			icons = {
				collapsed = "",
				current_frame = "",
				expanded = "",
			},
			layouts = {
				{
					elements = {
						{
							id = "console",
							size = 0.30,
						},
						{
							id = "repl",
							size = 0.70,
						},
					},
					position = "right",
					size = 60,
				},
			},
			mappings = {
				edit = "e",
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				repl = "r",
				toggle = "t",
			},
			render = {
				indent = 1,
				max_value_lines = 100,
			},
		})

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
}
