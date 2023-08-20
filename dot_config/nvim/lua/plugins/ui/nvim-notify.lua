return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	keys = {
		{
			"<leader>sN",
			"<CMD>Telescope notify<CR>",
			desc = "notifications",
		},
	},
	config = function()
		require("telescope").load_extension("notify")
		require("notify").setup({
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
			stages = "slide",
			timeout = 1000,
			top_down = false,
		})
	end,
}
