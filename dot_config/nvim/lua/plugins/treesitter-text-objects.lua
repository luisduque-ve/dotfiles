return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	lazy = false,
	branch = "main",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("nvim-treesitter-textobjects").setup()
		local tsselect = require("nvim-treesitter-textobjects.select").select_textobject
		vim.keymap.set({ "x", "o" }, "af", function()
			tsselect("@function.outer", "textobjects")
		end)
		vim.keymap.set({ "x", "o" }, "if", function()
			tsselect("@function.inner", "textobjects")
		end)
		vim.keymap.set({ "x", "o" }, "ac", function()
			tsselect("@class.outer", "textobjects")
		end)
		vim.keymap.set({ "x", "o" }, "ic", function()
			tsselect("@class.inner", "textobjects")
		end)
	end,
}
