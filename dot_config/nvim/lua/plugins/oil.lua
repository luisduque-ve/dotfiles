return {
	"stevearc/oil.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")
		oil.setup({
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				["<C-h>"] = false,
				["<C-l>"] = false,
				["<C-p>"] = false,
				["<C-n>"] = false,
				["q"] = "actions.close",
				["<C-y>"] = function()
					require("oil.actions").yank_entry.callback()
					print("oil entry copied to clipboard")
				end,
				["<C-e>"] = {
					callback = function()
						oil.open_preview({ vertical = true, split = "botright" })
					end,
				},
			},
		})
		-- not sure why this is not correctly handle in the
		-- lazy's keys table
		vim.keymap.set("n", "<leader>.", require("oil").open, { desc = "oil" })
	end,
}
