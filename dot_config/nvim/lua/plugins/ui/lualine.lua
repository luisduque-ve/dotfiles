return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
	        vim.opt.showtabline=0
		require("lualine").setup({
			options = {
				theme = "gruvbox_light",
			},
			sections = {
				lualine_b = { "branch" },
				lualine_x = { "tabs", "searchcount", "filetype" },
			},
		})
	end,
}
