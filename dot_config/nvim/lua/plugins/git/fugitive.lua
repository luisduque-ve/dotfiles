return {
	"tpope/vim-fugitive",
	cmd = { "Git" },
	keys = {
		{ "<leader>gX", "<CMD>Gread<CR>", desc = "discard_changes" },
		{ "<leader>ga", "<CMD>Git add % <CR>", desc = "add" },
		{ "<leader>gm", ":GMove ", desc = "move" },
		{ "<leader>gr", ":GRename ", desc = "rename" },
		{ "<leader>gx", ":Git ", desc = "execute" },
	},
}
