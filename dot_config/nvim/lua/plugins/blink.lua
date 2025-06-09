return {
	"saghen/blink.cmp",
	dependencies = {
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
				-- add html snippets to js files
				require("luasnip").filetype_extend("javascript", { "html" })
				require("luasnip").filetype_extend("htmldjango", { "html" })
			end,
		},
	},
	opts = {
		snippets = { preset = "luasnip" },
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = { implementation = "lua" },
	},
}
