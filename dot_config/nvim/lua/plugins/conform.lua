return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				cpp = { "clang-format" },
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

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.cpp",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.lua",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})

		vim.keymap.set(
			{ "n", "v" },
			"<leader>uf",
			"<CMD>lua require('conform').format({async = true})<CR><CMD>w<CR>",
			{ desc = "format" }
		)
	end,
}
