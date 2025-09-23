return {
	"ibhagwan/fzf-lua",
	lazy = false,
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
		vim.keymap.set("n", "grr", "<CMD>FzfLua lsp_references<CR>", { desc = "lsp_references" })
		vim.keymap.set("n", "<Leader>sa", "<CMD>FzfLua zoxide<CR>", { desc = "zoxide" })
		vim.keymap.set("n", "<Leader>sd", "<CMD>FzfLua dap_configurations<CR>", { desc = "dap_configurations" })
		vim.keymap.set("n", "<Leader>sf", "<CMD>FzfLua<CR>", { desc = "fzf-lua" })
		vim.keymap.set("n", "<leader>sg", "<CMD>FzfLua live_grep<CR>", { desc = "live_grep" })
		vim.keymap.set("n", "<leader>sh", "<CMD>FzfLua help_tags<CR>", { desc = "help_tags" })
		vim.keymap.set("n", "<Leader>sm", "<CMD>FzfLua marks<CR>", { desc = "marks" })
		vim.keymap.set("n", "<Leader>sr", "<CMD>FzfLua oldfiles<CR>", { desc = "recent_files" })
		vim.keymap.set("n", "<leader>s<leader>", "<CMD>FzfLua buffers<CR>", { desc = "buffers" })
		vim.keymap.set("n", "<leader>sk", "<CMD>FzfLua keymaps<CR>", { desc = "keymaps" })
		vim.keymap.set("n", "<leader>ss", "<CMD>FzfLua lsp_document_symbols<CR>", { desc = "lsp_document_symbols" })
		vim.keymap.set({ "n", "i" }, "<F4>", "<CMD>FzfLua dap_commands<CR>", { desc = "dap_commands" })
		vim.keymap.set("n", "<leader>sc", "<CMD>FzfLua commands<CR>", { desc = "command" })
	end,
}
