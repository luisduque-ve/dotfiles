return {
	"mfussenegger/nvim-dap-python",
	ft = "python",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("dap-python").setup(vim.g.python3_host_prog)
		local dap_configurations = require("dap").configurations.python
		table.insert(dap_configurations, {
			type = "python",
			request = "attach",
			name = "Attach to a docker container",
			host = "localhost",
			port = 5678,
			pathMappings = {
				-- both local and remote root are just templates here
				-- you must change according your project structure
				{ ["localRoot"] = "${workspaceFolder}", ["remoteRoot"] = "./src" },
			},
		})
		-- nvim-dap-python stores configurations in a fixed array
		-- there shouldn't any issue by adding to fixed indexes
		dap_configurations[1].justMyCode = false
		-- if you want to print the current config values
		-- at startup for debugging proproses just uncomment
		-- the bellow for statement
		--
		-- for _, config in ipairs(dap_configurations) do
		--   print(vim.inspect(config))
		-- end
	end,
}
