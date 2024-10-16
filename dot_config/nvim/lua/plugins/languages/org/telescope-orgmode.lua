return {
	"nvim-orgmode/telescope-orgmode.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-orgmode/orgmode",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("telescope").load_extension("orgmode")

		vim.keymap.set(
			"n",
			"<leader>sh",
			require("telescope").extensions.orgmode.search_headings,
			{ desc = "org_headlines" }
		)
	end,
}
