return {
	"nvim-neotest/neotest",
	ft = "python", -- only working with python right now
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-neotest/neotest-python",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python")({
					dap = { justMyCode = false },
				}),
			},
		})
	end,
	keys = {
		{ "<leader>tn", "<CMD>lua require('neotest').run.run()<CR>", desc = "nearest" },
		{ "<leader>tl", "<CMD>lua require('neotest').run.run_last()<CR>", desc = "last" },
		{ "<leader>tf", "<CMD>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", desc = "file" },
		{ "<leader>td", "<CMD>lua require('neotest').run.run({strategy = 'dap'})<CR>", desc = "debug" },
		{ "<leader>tp", "<CMD>lua require('neotest').summary.toggle()<CR>", desc = "summary_panel" },
		{ "<leader>to", "<CMD>lua require('neotest').output_panel.toggle()<CR>", desc = "output_panel" },
	},
}
