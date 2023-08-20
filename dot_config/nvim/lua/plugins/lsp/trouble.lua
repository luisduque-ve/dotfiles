return {
	"folke/trouble.nvim",
	cmd = "TroubleToggle",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		action_keys = {
			jump_close = { "<cr>" },
		},
	},
	keys = {
		{ "<leader>sq", "<CMD>TroubleToggle quickfix<CR>", desc = "quickfix" },
	},
}
