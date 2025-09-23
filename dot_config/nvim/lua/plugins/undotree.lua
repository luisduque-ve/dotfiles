return {
	"mbbill/undotree",
	lazy = false,
	config = function()
		vim.keymap.set("n", "u", "<cmd>UndotreeToggle<cr><C-w>h", { desc = "undotree" })
	end,
}
