--
-- Only not plugin related mappins in this file
--

vim.keymap.set({ "n" }, "n", "n<CMD>echo searchcount()<CR>")
vim.keymap.set({ "n" }, "N", "N<CMD>echo searchcount()<CR>")

-- buffers
vim.keymap.set({ "n" }, "<leader>bd", "<CMD>bd<CR>", { desc = "close" })

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "escape_and_clear_hlsearch" })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(_)
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
vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>")
vim.keymap.set({ "t" }, "<C-o>", "<C-\\><C-n><C-o>")
vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>")

-- tabs
vim.keymap.set({ "n", "v", "i", "t" }, "<M-Right>", "<CMD>tabnext<CR>", { desc = "tabnext" })
vim.keymap.set({ "n", "v", "i", "t" }, "<M-Left>", "<CMD>tabprevious<CR>", { desc = "tabprevious" })
vim.keymap.set({ "n" }, "<leader>mt", "<CMD>tabnew<CR>", { desc = "tab" })

-- insert mode keymaps
vim.keymap.set("i", "<M-BS>", "<C-w>", { noremap = true })
vim.keymap.set("i", "<D-BS>", "<C-u>", { noremap = true })

vim.keymap.set({ "n", "v" }, "<M-o>", ":")
vim.keymap.set("i", "<M-o>", "<Esc>:")
vim.keymap.set({ "t" }, "<M-o>", "<C-\\><C-n>:")

vim.keymap.set("n", "s", "<Nop>", { noremap = true, silent = true })
