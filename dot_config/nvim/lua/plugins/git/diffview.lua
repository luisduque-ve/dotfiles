return {
	"sindrets/diffview.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>gd", "<CMD>DiffviewOpen<CR>", desc = "open_diffview" },
		{ "<leader>gD", "<CMD>DiffviewClose<CR><CMD>0Git<CR>", desc = "close_diffview" },
	},
	config = function()
		local actions = require("diffview.actions")
		require("diffview").setup({
			keymaps = {
				file_panel = {
					{
						"n",
						"<c-d>",
						actions.scroll_view(0.25),
						{ desc = "scroll_the_view_down" },
					},
					{
						"n",
						"<c-u>",
						actions.scroll_view(-0.25),
						{ desc = "scroll_the_view_up" },
					},
				},
			},
		})
	end,
}
