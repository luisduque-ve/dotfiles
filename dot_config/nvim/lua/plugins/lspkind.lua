return {
	"onsails/lspkind.nvim",
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(ev)
				require("lspkind").setup()
			end,
		})
	end,
}
