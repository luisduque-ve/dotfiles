return {
	"nvim-telescope/telescope-dap.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap" },
	config = function()
		require("telescope").load_extension("dap")
	end,
	keys = {
		{ "sd", "<CMD>Telescope dap commands<CR>", desc = "dap_command" },
		{ "sB", "<CMD>Telescope dap list_breakpoints<CR>", desc = "breakpoints" },
	},
}