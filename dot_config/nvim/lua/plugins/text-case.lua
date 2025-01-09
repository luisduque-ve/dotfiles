return {
	"johmsalas/text-case.nvim",
	event = { "BufReadPost", "BufNewFile" },
	opts = {},
	keys = {
		-- this plugin automatically add some keymaps most of then with
		-- ga prefix, but which keys descriptions are not in the same
		-- standard as my and I found those keymaps not very intuitives
		{ "<leader>ucs", "<CMD>lua require('textcase').operator('to_snake_case')<CR>", desc = "snake" },
		{ "<leader>ucc", "<CMD>lua require('textcase').operator('to_camel_case')<CR>", desc = "camel" },
		{ "<leader>ucp", "<CMD>lua require('textcase').operator('to_pascal_case')<CR>", desc = "pascal" },
	},
}
