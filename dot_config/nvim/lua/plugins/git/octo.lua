return {
	"pwntester/octo.nvim",
	cmd = "Octo",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {},
	keys = {
		{ "<leader>goC", ":Octo pr close ", silent = false, desc = "close_pr" },
		{ "<leader>goc", "<CMD>Octo pr create draft<CR>", desc = "create_draft_pr" },
		{ "<leader>god", "<CMD>Octo review discard<CR>", desc = "discard_review" },
		{ "<leader>goe", ":Octo pr edit ", silent = false, desc = "edit_pr" },
		{ "<leader>gol", "<CMD>Octo pr list<CR>", desc = "list_prs" },
		{ "<leader>gos", "<CMD>Octo review start<CR>", desc = "start_review" },
		{ "<leader>gou", ":Octo pr url ", silent = false, desc = "copy_pr_url" },
	},
}
