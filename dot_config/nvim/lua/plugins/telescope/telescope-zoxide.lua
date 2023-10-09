return {
	"jvgrootveld/telescope-zoxide",
	dependencies = { "nvim-telescope/telescope.nvim" },
	event = "VeryLazy",
	config = function()
		require("telescope").load_extension("zoxide")
	end,
	keys = {
		{ "<Leader>sp", "<CMD>Telescope zoxide list<CR>", desc = "zoxide" },
	},
}
