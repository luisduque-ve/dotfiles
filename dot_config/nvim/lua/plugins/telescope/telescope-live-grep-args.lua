return {
	"nvim-telescope/telescope-live-grep-args.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-telescope/telescope.nvim" },
	keys = {
		{
			"<leader>sg",
			"<CMD>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
			desc = "live_grep",
		},
	},
}
