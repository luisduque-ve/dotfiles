return {
	"gbprod/yanky.nvim",
	event = "VeryLazy",
	config = function()
		require("yanky").setup({
			highlight = {
				timer = 200,
			},
		})
		vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
		vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
		vim.keymap.set("n", "]y", "<Plug>(YankyCycleForward)", { desc = "yank" })
		vim.keymap.set("n", "[y", "<Plug>(YankyCycleBackward)", { desc = "yank" })
	end,
}
