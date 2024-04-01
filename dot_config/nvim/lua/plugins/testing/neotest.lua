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
		vim.api.nvim_set_hl(0, "NeotestPassed", { fg = "#8ec07c", bold = true }) -- Gruvbox yellow, for passed tests
		vim.api.nvim_set_hl(0, "NeotestFailed", { fg = "#cc241d" }) -- Gruvbox red, for failed tests
		vim.api.nvim_set_hl(0, "NeotestRunning", { fg = "#458588" }) -- Gruvbox blue, for running tests
		vim.api.nvim_set_hl(0, "NeotestSkipped", { fg = "#b16286" }) -- Gruvbox purple, for skipped tests
		vim.api.nvim_set_hl(0, "NeotestFile", { fg = "#98971a" }) -- Gruvbox yellow, for files
		vim.api.nvim_set_hl(0, "NeotestDir", { fg = "#458588" }) -- Gruvbox blue, for directories
		vim.api.nvim_set_hl(0, "NeotestNamespace", { fg = "#b16286" }) -- Gruvbox purple, for namespaces
		vim.api.nvim_set_hl(0, "NeotestFocused", { fg = nil, bold = true, underline = true }) -- Keep styling without specific color
		vim.api.nvim_set_hl(0, "NeotestIndent", { fg = "#928374" }) -- Gruvbox gray, for indentation
		vim.api.nvim_set_hl(0, "NeotestExpandMarker", { fg = "#7c6f64" }) -- Gruvbox dark gray, for expand markers
		vim.api.nvim_set_hl(0, "NeotestAdapterName", { fg = "#cc241d" }) -- Gruvbox red, for adapter names
		vim.api.nvim_set_hl(0, "NeotestWinSelect", { fg = "#689d6a", bold = true }) -- Gruvbox green, for window selection
		vim.api.nvim_set_hl(0, "NeotestMarked", { fg = "#d79921", bold = true }) -- Gruvbox orange, for marked items
		vim.api.nvim_set_hl(0, "NeotestTarget", { fg = "#cc241d" }) -- Gruvbox red, for targets
		vim.api.nvim_set_hl(0, "NeotestTest", { fg = "#458588" }) -- Gruvbox blue, for tests
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
