return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
		-- Only one of these is needed.
		"ibhagwan/fzf-lua", -- optional
	},
	config = true,
	keys = {
		{ "<leader>gg", "<CMD>Neogit kind=replace<CR>", desc = "neogit" },
	},
}
