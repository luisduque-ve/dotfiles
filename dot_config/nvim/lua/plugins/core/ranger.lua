return {
	"kelly-lin/ranger.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		{ "<leader>ur", "<CMD>lua require('ranger-nvim').open(true)<CR>", desc = "ranger" },
	},
}
