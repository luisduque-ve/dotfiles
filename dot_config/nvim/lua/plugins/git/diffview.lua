return {
	"sindrets/diffview.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>gD", "<CMD>DiffviewClose<CR>", desc = "close_diffview" },
		{ "<leader>gc", ":DiffviewOpen ", desc = "custom_diff" },
		{ "<leader>gd", "<CMD>DiffviewOpen<CR>", desc = "open_diffview" },
		{ "<leader>gf", "<CMD>DiffviewFileHistory %<CR>", desc = "current_file_history" },
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
