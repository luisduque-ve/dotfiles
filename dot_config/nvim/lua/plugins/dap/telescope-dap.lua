return {
	"nvim-telescope/telescope-dap.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap" },
	config = function()
		require("telescope").load_extension("dap")
	end,
	keys = {
		{ "<F4>", "<CMD>Telescope dap commands<CR>", desc = "DAP" },
	},
}
