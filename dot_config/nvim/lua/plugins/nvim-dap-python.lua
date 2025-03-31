return {
	"mfussenegger/nvim-dap-python",
	ft = "python",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("dap-python").setup("uv")
		local dap_configurations = require("dap").configurations.python

		-- Function to prompt for an argument with a default value
		local function prompt_args(default)
			local input = vim.fn.input("Args: ", default)
			return input ~= "" and input or default
		end

		table.insert(dap_configurations, {
			name = "FastAPI",
			type = "python",
			request = "launch",
			module = "uvicorn",
			args = function()
				return { prompt_args("app.main:app"), "--port", "8000", "--loop", "asyncio" }
			end,
			justMyCode = false,
		})

		table.insert(dap_configurations, {
			type = "python",
			request = "attach",
			name = "Attach to a docker container",
			host = "localhost",
			port = 5678,
			pathMappings = {
				{ ["localRoot"] = "${workspaceFolder}", ["remoteRoot"] = "./src" },
			},
		})

		-- Set justMyCode for all configurations if needed
		for _, config in ipairs(dap_configurations) do
			config.justMyCode = false
		end

		-- Uncomment below to print configurations for debugging
		-- for _, config in ipairs(dap_configurations) do
		--   print(vim.inspect(config))
		-- end
	end,
}
