require("configs")
require("autocmds")

require("vim._extui").enable({}) -- enable experimental ui

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
vim.keymap.set({ "n" }, "<leader>l", "<CMD>Lazy<CR>", { desc = "Lazy" })

vim.diagnostic.config({
	virtual_text = { current_line = false },
})

vim.lsp.enable({
	"clangd",
	"json",
	"luals",
	"pyright",
	"tsserver",
})

require("keymaps")
