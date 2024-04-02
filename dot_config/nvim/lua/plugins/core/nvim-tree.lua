-- why this plugin if I have telescope?
-- for new projects where I don't know the file
-- structure, that's all.
return {
	"nvim-tree/nvim-tree.lua",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			view = {
				number = true,
				relativenumber = true,
			},
		})
	end,
	keys = {
		-- why o? just muscle memory I used to use oil.nvim
		{ "<leader>o", "<CMD>NvimTreeToggle<CR>", desc = "nvim_tree" },
	},
}
