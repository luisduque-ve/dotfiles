return {
	"sindrets/diffview.nvim",
	event = "VeryLazy",
	config = function()
		local actions = require("diffview.actions")
		require("diffview").setup({
			view = {
				merge_tool = {
					layout = "diff4_mixed",
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
		vim.keymap.set("n", "<leader>gd", function()
			local lib = require("diffview.lib")
			local view = lib.get_current_view()
			if view then
				-- Current tabpage is a Diffview; close it
				vim.cmd.DiffviewClose()
			else
				-- No open Diffview exists: open a new one
				vim.cmd.DiffviewOpen()
			end
		end, { desc = "diffview" })
	end,
}
