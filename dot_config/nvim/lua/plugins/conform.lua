return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				cpp = { "clang-format" },
				html = { "prettier" },
				htmldjango = { "djlint" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				python = { "autoflake", "isort", "darker" },
				swift = { "swiftformat" },
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

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = { "*.lua", "*.cpp", "*.swift", "*.jsx", "*.tsx" },
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})

		vim.keymap.set(
			{ "n", "v" },
			"<leader>mf",
			"<CMD>lua require('conform').format({async = true})<CR><CMD>w<CR>",
			{ desc = "format" }
		)
	end,
}
