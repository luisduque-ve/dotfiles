return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		action_keys = {
			jump_close = { "<cr>" },
		},
	},
	keys = {
		{ "<leader>sq", "<CMD>Trouble quickfix<CR>", desc = "quickfix" },
	},
}
