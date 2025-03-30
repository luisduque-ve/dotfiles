return {
	"folke/which-key.nvim",
	dependencies = {
		"echasnovski/mini.icons",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		local wk = require("which-key")


  wk.setup({
    sort = { "alphanum"}
  })
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(ev)
				wk.add({
					{ "<leader>h", group = "+LSP" },
				}, {
					buffer = 0,
				})
			end,
		})

		wk.add({
			{ "<leader>b", group = "+buffer" },
			{ "<leader>g", group = "+git" },
			{ "<leader>s", group = "+search" },
			{ "<leader>t", group = "+test" },
			{ "<leader>tc", group = "+coverage" },
			{ "<leader>u", group = "+utils" },
			{
				"<leader>w",
				'<cmd>lua require("which-key").show({keys = "<c-w>", loop=true})<cr>',
				desc = "window",
			},
		})
	end,
}
