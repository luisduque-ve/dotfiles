return {
	"theHamsta/nvim-dap-virtual-text",
	-- I'm mostly debugging python at the moment
	ft = "python",
	cond = false, -- disable until I found how to truncate long texts
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("nvim-dap-virtual-text").setup({})
	end,
}
