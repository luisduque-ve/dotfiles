-- See this, I do not use lazyvim, the distro, but is giving me
-- issues with lazy only the package manager
-- https://github.com/m4xshen/hardtime.nvim/issues/74#issuecomment-2067659330
return {
	"m4xshen/hardtime.nvim",
	dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	opts = {
		allow_different_keys = true,
	},
	command = "Hardtime",
	event = "BufEnter",
	keys = {
		{ "n", "j", "<cmd>Hardtime<CR>", desc = "Hardtime" },
		{ "n", "k", "<cmd>Hardtime<CR>", desc = "Hardtime" },
		{ "n", "gj", "<cmd>Hardtime<CR>", desc = "Hardtime" },
		{ "n", "gk", "<cmd>Hardtime<CR>", desc = "Hardtime" },
	},
}
