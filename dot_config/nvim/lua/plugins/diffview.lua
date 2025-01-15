return {
	"sindrets/diffview.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>gc", "<CMD>DiffviewClose<CR>", desc = "close_diffview" },
		{ "<leader>gd", "<CMD>DiffviewOpen<CR>", desc = "open_diffview" },
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
					layout = "diff3_horizontal",
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
