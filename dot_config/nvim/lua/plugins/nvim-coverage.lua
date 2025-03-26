return {
	"andythigpen/nvim-coverage",
	version = "*",
	config = function()
		local cov = require("coverage")

		cov.setup({
			auto_reload = true,
		})
	end,
	keys = {
		{ "<leader>tcc", "<cmd>Coverage<cr>", desc = "coverage" },
		{ "<leader>tcs", "<cmd>CoverageSummary<cr>", desc = "summary" },
		{ "<leader>tct", "<cmd>CoverageToggle<cr>", desc = "toggle_signs" },
		{ "<leader>tcx", "<cmd>CoverageClear<cr>", desc = "clear" },
	},
}
