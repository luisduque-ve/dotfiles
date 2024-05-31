return {
	"stevearc/oil.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				["<C-h>"] = false,
				["<C-l>"] = false,
				["q"] = "actions.close",
			},
		})
		-- not sure why this is not correctly handle in the
		-- lazy's keys table
		vim.keymap.set("n", "<leader>o", require("oil").open, { desc = "oil" })
	end,
}
