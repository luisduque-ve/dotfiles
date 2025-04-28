return {
	"m4xshen/hardtime.nvim",
	dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	opts = {
		disabled_keys = {
			["<Left>"] = { "n", "x" },
			["<Right>"] = { "n", "x" },
		},
		allow_different_keys = true,
	},
	command = "Hardtime",
	event = "VeryLazy",
}
