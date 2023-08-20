return {
	"nvim-telescope/telescope-project.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		require("telescope").load_extension("project")
	end,
	keys = {
		{ "<Leader>sp", "<CMD>Telescope project<CR>", desc = "project" },
	},
}
