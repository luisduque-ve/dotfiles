return {
	"NeogitOrg/neogit",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"ibhagwan/fzf-lua",
	},
	config = function()
		require("neogit").setup({
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
		})

		vim.keymap.set("n", "<leader>gg", "<CMD>Neogit kind=replace<CR>", { desc = "neogit" })
	end,
}
