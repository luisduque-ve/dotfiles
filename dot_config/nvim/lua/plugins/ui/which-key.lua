return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.setup({
			plugins = { spelling = true },
			key_labels = { ["<leader>"] = "SPC" },
		})
		-- normal mode
		wk.register({
			["<leader>b"] = {
				name = "+buffer",
			},
			["<leader>c"] = {
				name = "+ai",
			},
			["<leader>d"] = {
				name = "+debug",
			},
			["<leader>g"] = {
				name = "+git",
			},
			["<leader>s"] = {
				name = "+search",
			},
			["<leader>t"] = {
				name = "+test",
			},
			["<leader>u"] = {
				name = "+utils",
				["c"] = {
					name = "+change_case_to",
				},
				["m"] = {
					name = "+markdown",
				},
				["w"] = {
					name = "+window",
				},
			},
		})
		-- visual mode
		wk.register({
			["<leader>c"] = {
				name = "+chatgpt",
			},
		}, { mode = "v" })
	end,
}
