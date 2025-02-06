return {
	{
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
					"kdl",
					"lua",
					"markdown",
					"markdown_inline",
					"org",
					"python",
					"regex",
					"terraform",
					"typescript",
					"vim",
					"yaml",
				},
				sync_install = false,
				highlight = {
					enable = true, -- false will disable the whole extension
					additional_vim_regex_highlighting = false,
				},
			})
		end,
		keys = {
			{ "<leader>uh", "<CMD>TSToggle highlight<CR>", desc = "toogle_ts_highlight" },
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "VeryLazy",
		dependencies = "nvim-treesitter/nvim-treesitter-context",
		opts = {
			max_lines = 1,
			trim_scope = "outer",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["ab"] = "@block.outer",
							["ib"] = "@block.inner",
						},
					},
				},
			})
		end,
	},
}
