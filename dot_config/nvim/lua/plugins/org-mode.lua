return {
	{
		"nvim-orgmode/org-bullets.nvim",
		event = "VeryLazy",
		ft = { "org" },
		opts = {},
	},
	{
		"nvim-orgmode/orgmode",
		event = "VeryLazy",
		ft = { "org" },
		config = function()
			-- Setup orgmode
			require("orgmode").setup({
				org_agenda_files = "~/org/**/*",
				org_default_notes_file = "~/org/refile.org",
				org_startup_folded = "showeverything",
				mappings = {
					org_return_uses_meta_return = true,
				},
			})
		end,
	},
	{
		"dhruvasagar/vim-table-mode",
		event = "VeryLazy",
	},
}
