return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"ibhagwan/fzf-lua",
	},
	opts = {
		disable_relative_line_numbers = false,
		mappings = {
			finder = {
				["<c-n>"] = false,
				["<c-p>"] = false,
			},
			status = {
				["<c-n>"] = false,
				["<c-p>"] = false,
				["1"] = false,
				["2"] = false,
				["3"] = false,
				["4"] = false,
			},
		},
	},
	keys = {
		{ "<leader>gg", "<CMD>Neogit kind=replace<CR>", desc = "neogit" },
	},
}
