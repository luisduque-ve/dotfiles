return {
	"vim-test/vim-test",
	ft = "python", -- only working with python right now
	config = function()
		vim.g["test#strategy"] = "neovim"
		vim.g["test#neovim#term_position"] = "vert botright 70"
	end,
	keys = {
		{ "<leader>tn", "<CMD>TestNearest<CR>", desc = "nearest" },
		{ "<leader>tf", "<CMD>TestFile<CR>", desc = "file" },
		{ "<leader>ts", "<CMD>TestSuite<CR>", desc = "suite" },
		{ "<leader>tl", "<CMD>TestLast<CR>", desc = "last" },
		{ "<leader>tv", "<CMD>TestVisit<CR>", desc = "visit" },
	},
}
