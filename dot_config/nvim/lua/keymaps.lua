--
-- Only not plugin related mappins in this file
--

-- buffers
vim.keymap.set({ "n" }, "<leader>bc", "<CMD>bufdo bwipeout<CR>", { desc = "close_all" })
vim.keymap.set({ "n" }, "<leader>bd", "<CMD>bd<CR>", { desc = "close" })
vim.keymap.set({ "n" }, "<leader>bo", "<CMD>on<CR>", { desc = "only" })

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "escape_and_clear_hlsearch" })

vim.keymap.set({ "n" }, "<C-h>", "<C-w>h", { desc = "left_window" })
vim.keymap.set({ "n" }, "<C-j>", "<C-w>j", { desc = "lower_window" })
vim.keymap.set({ "n" }, "<C-k>", "<C-w>k", { desc = "upper_window" })
vim.keymap.set({ "n" }, "<C-l>", "<C-w>l", { desc = "right_window" })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		vim.keymap.set({ "n" }, "<leader>ha", "<CMD>lua vim.lsp.buf.code_action()<CR>", { desc = "code_action" })
		vim.keymap.set({ "n" }, "<leader>hd", "<CMD>lua vim.diagnostic.open_float()<CR>", { desc = "show_diagnostic" })
		vim.keymap.set(
			{ "n" },
			"<leader>hf",
			"<CMD>lua vim.lsp.buf.format({async = true})<CR><CMD>w<CR>",
			{ desc = "format" }
		)
		vim.keymap.set({ "n" }, "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", { desc = "lsp_definition" })
		vim.keymap.set({ "n" }, "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", { desc = "lsp_implementation" })
		vim.keymap.set({ "n" }, "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", { desc = "lsp_declaration" })
		vim.keymap.set({ "n" }, "gs", "<CMD>lua vim.lsp.buf.signature_help()<CR>", { desc = "lsp_signature" })
		vim.keymap.set({ "n" }, "go", "<CMD>lua vim.lsp.buf.type_definition()<CR>", { desc = "lsp_type_definition" })
	end,
})

-- term
vim.keymap.set("t", "<C-space>", "<C-\\><C-n>")
vim.keymap.set({ "t" }, "<C-o>", "<C-\\><C-n><C-o>")
vim.keymap.set({ "t" }, "<C-i>", "<C-\\><C-n><C-i>")

-- tabs
vim.keymap.set({ "n", "v", "i", "t" }, "<M-Right>", "<CMD>tabnext<CR>", { desc = "tabnext" })
vim.keymap.set({ "n", "v", "i", "t" }, "<M-Left>", "<CMD>tabprevious<CR>", { desc = "tabprevious" })
vim.keymap.set({ "n" }, "<leader>ut", "<CMD>tabnew<CR>", { desc = "tab" })

-- insert mode keymaps
vim.keymap.set("i", "<M-BS>", "<C-w>", { noremap = true })
vim.keymap.set("i", "<D-BS>", "<C-u>", { noremap = true })
