return {
	"folke/which-key.nvim",
	dependencies = { "echasnovski/mini.icons", "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>b", group = "+buffer" },
			{ "<leader>c", group = "+ai" },
			{ "<leader>d", group = "+debug" },
			{ "<leader>g", group = "+git" },
			{ "<leader>gd", group = "+diff" },
			{ "<leader>s", group = "+search" },
			{ "<leader>t", group = "+test" },
			{ "<leader>u", group = "+utils" },
			{ "<leader>uc", group = "+change_case_to" },
			{ "<leader>um", group = "+markdown" },
			{ "<leader>uw", group = "+window" },
		})
	end,
}
