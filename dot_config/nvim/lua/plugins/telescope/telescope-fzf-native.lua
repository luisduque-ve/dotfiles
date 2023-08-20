return {
	"nvim-telescope/telescope-fzf-native.nvim",
	build = "arch --arm64 make",
	dependencies = { "nvim-telescope/telescope.nvim" },
	event = "VeryLazy",
	config = function()
		require("telescope").load_extension("fzf")
	end,
}
