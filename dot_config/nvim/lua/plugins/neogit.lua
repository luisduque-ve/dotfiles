return {
	"NeogitOrg/neogit",
	cond = not vim.g.vscode,
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
		-- Only one of these is needed.
		"ibhagwan/fzf-lua", -- optional
	},
	opts = {
		-- disable_line_numbers = false,
		disable_relative_line_numbers = false,
		mappings = {
			finder = {
				["<c-n>"] = false,
				["<c-p>"] = false,
			},
			status = {
				["<c-n>"] = false,
				["<c-p>"] = false,
			},
		},
	},
	keys = {
		{ "<leader>gg", "<CMD>Neogit kind=replace<CR>", desc = "neogit" },
	},
}
