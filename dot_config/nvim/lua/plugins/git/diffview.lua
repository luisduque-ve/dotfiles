return {
	"sindrets/diffview.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>gdc", "<CMD>DiffviewClose<CR>", desc = "close" },
		{ "<leader>gdC", ":DiffviewOpen ", desc = "custom" },
		{ "<leader>gdo", "<CMD>DiffviewOpen<CR>", desc = "open" },
		{ "<leader>gdf", "<CMD>DiffviewFileHistory %<CR>", desc = "file_history" },
	},
	config = function()
		local actions = require("diffview.actions")
		require("diffview").setup({
			hooks = {
				view_opened = function(view)
					-- Hide the file panel when a Diffview is opened
					vim.cmd("DiffviewToggleFiles")
				end,
			},
			view = {
				merge_tool = {
					layout = "diff3_mixed",
				},
			},
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
