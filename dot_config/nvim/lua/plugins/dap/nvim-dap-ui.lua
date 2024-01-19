return {
	"rcarriga/nvim-dap-ui",
	-- I'm mostly debugging python at the moment
	ft = "python",
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
			layouts = {
				{
					elements = {
						{
							id = "watches",
							size = 0.30,
						},
						{
							id = "stack",
							size = 0.70,
						},
					},
					position = "right",
					size = 60,
				},
				{
					elements = {
						{
							id = "repl",
							size = 0.5,
						},
						{
							id = "console",
							size = 0.5,
						},
					},
					position = "bottom",
					size = 10,
				},
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
	keys = {
		{
			"<leader>dO",
			"<CMD>lua require('dapui').float_element('console', {enter=true, width=45, height=30})<CR>",
			desc = "console_output",
		},
		{
			"<leader>df",
			"<CMD>lua require('dapui').float_element('stacks', {enter=true, width=45, height=30})<CR>",
			desc = "stacks",
		},
		{
			"<leader>ds",
			"<CMD>lua require('dapui').float_element('scopes', {enter=true, width=45, height=30})<CR>",
			desc = "scopes",
		},
	},
}
