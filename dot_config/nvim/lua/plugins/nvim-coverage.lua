return {
	"andythigpen/nvim-coverage",
	lazy = false,
	version = "*",
	config = function()
		local cov = require("coverage")

		cov.setup({
			auto_reload = true,
		})
		vim.keymap.set("n", "<leader>tcc", "<cmd>Coverage<cr>", { desc = "coverage" })
		vim.keymap.set("n", "<leader>tcs", "<cmd>CoverageSummary<cr>", { desc = "summary" })
		vim.keymap.set("n", "<leader>tct", "<cmd>CoverageToggle<cr>", { desc = "toggle_signs" })
		vim.keymap.set("n", "<leader>tcx", "<cmd>CoverageClear<cr>", { desc = "clear" })
	end,
}
