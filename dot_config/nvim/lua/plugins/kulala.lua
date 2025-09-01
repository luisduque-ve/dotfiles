return {
	"mistweaverco/kulala.nvim",
	lazy = false,
	config = function()
		require("kulala").setup({
			global_keymaps = true,
			global_keymaps_prefix = "<leader>k",
			kulala_keymaps_prefix = "",
			ui = {
				win_opts = {
					wo = {
						foldenable = false, -- completely disable folding
					},
				},
			},
		})
		vim.filetype.add({
			extension = {
				["http"] = "http",
			},
		})
		local wk = require("which-key")
		wk.add({ "<leader>k", group = "+kulala" })
	end,
}
