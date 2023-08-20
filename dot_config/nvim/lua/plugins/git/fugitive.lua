return {
	"tpope/vim-fugitive",
	cmd = { "Git" },
	keys = {
		{ "<leader>ga", "<CMD>Git add % <CR>", desc = "add" },
		{ "<leader>ge", ":Git ", desc = "command" },
		{ "<leader>gg", "<CMD>0Git<CR>", desc = "fugitive" },
		{ "<leader>gl", "<CMD>0Git log --oneline<CR>", desc = "log" },
		{ "<leader>gm", ":GMove ", desc = "move" },
		{ "<leader>gp", "<CMD>Git push<CR>", desc = "push" },
		{ "<leader>gr", ":GRename ", desc = "rename" },
		{ "<leader>gx", "<CMD>Gread<CR>", desc = "discard_changes" },
	},
}
