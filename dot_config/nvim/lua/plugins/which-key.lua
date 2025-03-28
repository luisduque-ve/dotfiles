return {
	"folke/which-key.nvim",
	dependencies = {
		"echasnovski/mini.icons",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>b", group = "+buffer" },
			{ "<leader>c", group = "+ai", mode = { "n", "v" } },
			{ "<leader>g", group = "+git" },
			{ "<leader>n", group = "+next" },
			{ "<leader>p", group = "+previous" },
			{ "<leader>s", group = "+search" },
			{ "<leader>t", group = "+test" },
			{ "<leader>tc", group = "+coverage" },
			{ "<leader>u", group = "+utils" },
			{ "<leader>uc", group = "+change_case_to" },
			{ "<leader>um", group = "+markdown" },
			{ "<leader>uw", group = "+window" },
			{
				"<leader>w",
				'<cmd>lua require("which-key").show({keys = "<c-w>", loop=true})<cr>',
				desc = "window",
			},
		})
	end,
}
