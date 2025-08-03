return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		local fzf = require("fzf-lua")
		fzf.setup({
			keymap = {
				builtin = {
					["<C-d>"] = "preview-page-down",
					["<C-u>"] = "preview-page-up",
				},
				fzf = {
					["ctrl-q"] = "select-all+accept",
				},
			},
		})
	end,
	keys = {
		{ "grr", "<CMD>FzfLua lsp_references<CR>", desc = "lsp_references" },
		{ "<Leader>sa", "<CMD>FzfLua zoxide<CR>", desc = "zoxide" },
		{ "<Leader>sd", "<CMD>FzfLua dap_configurations<CR>", desc = "dap_configurations" },
		{ "<Leader>sf", "<CMD>FzfLua<CR>", desc = "fzf-lua" },
		{ "<leader>sg", "<CMD>FzfLua live_grep<CR>", desc = "live_grep" },
		{ "<Leader>sm", "<CMD>FzfLua marks<CR>", desc = "marks" },
		{ "<Leader>sr", "<CMD>FzfLua oldfiles<CR>", desc = "recent_files" },
		{ "<leader>su", "<CMD>FzfLua buffers<CR>", desc = "buffers" },
		{ "<leader>sk", "<CMD>FzfLua keymaps<CR>", desc = "keymaps" },
		{ "<leader>ss", "<CMD>FzfLua lsp_document_symbols<CR>", desc = "lsp_document_symbols" },
		{ "<F4>", "<CMD>FzfLua dap_commands<CR>", desc = "dap_commands", mode = { "n", "i" } },
		{ "<leader>sc", "<CMD>FzfLua commands<CR>", desc = "command" },
	},
}
