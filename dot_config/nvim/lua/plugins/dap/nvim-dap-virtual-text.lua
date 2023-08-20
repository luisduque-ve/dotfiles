return {
	"theHamsta/nvim-dap-virtual-text",
	-- I'm mostly debugging python at the moment
	event = "BufEnter *.py",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("nvim-dap-virtual-text").setup()
	end,
}
