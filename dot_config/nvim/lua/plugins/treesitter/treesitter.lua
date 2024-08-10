return {
	"nvim-treesitter/nvim-treesitter",
	-- if you find arch issues on a fresh install
	-- delete the plugin folder which is usually at
	-- ~/.local/share/nvim/lazy and then install the plugin
	-- from a native M1 terminal like iTerm2
	--
	-- yeah does not make sense but it is what it is
	-- https://github.com/nvim-treesitter/nvim-treesitter/issues/3674#issuecomment-1281118491
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"c",
				"commonlisp",
				"cpp",
				"fish",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"regex",
				"typescript",
				"vim",
				"yaml",
			},
			sync_install = false,
			highlight = {
				enable = true, -- false will disable the whole extension
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<CR>",
					scope_incremental = "<CR>",
					node_incremental = "<TAB>",
					node_decremental = "<S-TAB>",
				},
			},
		})
	end,
	keys = {
		{ "<leader>uh", "<CMD>TSToggle highlight<CR>", desc = "toogle_ts_highlight" },
	},
}
