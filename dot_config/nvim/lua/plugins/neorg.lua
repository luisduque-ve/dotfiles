return {
	-- To install the treesitter module
	-- CC=gcc-14 nvim -c "TSInstallSync norg"
	-- see why here:
	-- https://github.com/nvim-neorg/neorg/issues/1645#issuecomment-2699858774
	"nvim-neorg/neorg",
	lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
	version = "*", -- Pin Neorg to the latest stable release
	opts = {
		load = {
			["core.defaults"] = {},
			["core.concealer"] = {
				config = {
					folds = false,
				},
			},
			["core.dirman"] = {
				config = {
					workspaces = {
						default = "~/notes",
					},
					index = "index.norg", -- The name of the main (root) .norg file
					default_workspace = "default",
				},
			},
		},
	},
}
