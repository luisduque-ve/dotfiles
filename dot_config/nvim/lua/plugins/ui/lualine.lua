return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "gruvbox_light",
			},
			sections = {
				lualine_b = { "branch" },
				lualine_x = { "searchcount", "filetype" },
			},
		})
	end,
}
