return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				html = { "prettier" },
				htmldjango = { "djlint" },
				javascript = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				python = { "autoflake", "isort", "darker" },
				terraform = { "terraform_fmt" },
			},
			formatters = {
				autoflake = {
					prepend_args = { "--in-place", "--remove-unused-variables" },
				},
				isort = {
					prepend_args = { "--profile", "black" },
				},
			},
		})
		vim.keymap.set(
			{ "n", "v" },
			"<leader>uf",
			"<CMD>lua require('conform').format({async = true})<CR><CMD>w<CR>",
			{ desc = "format" }
		)
	end,
}
