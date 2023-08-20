return {
	"stevearc/oil.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			view_options = {
				show_hidden = true,
			},
		})
		-- not sure why this is not correctly handle in the
		-- lazy's keys table
		vim.keymap.set("n", "<leader>o", require("oil").open, { desc = "oil" })
	end,
}
