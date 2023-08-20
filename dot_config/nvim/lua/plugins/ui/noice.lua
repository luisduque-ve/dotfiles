return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		routes = {
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "%d+L, %d+B" },
						{ find = "; after #%d+" },
						{ find = "; before #%d+" },
						{ find = "line" },
					},
				},
				opts = { skip = true },
			},
			-- Here the order matters, first filter
			-- INSERT AND VISUAL, to avoid notifications
			-- when changing modes and then send msg_showmode
			-- to the notify view to get message like for example
			-- when you're recording a macro
			{
				filter = {
					event = "msg_showmode",
					any = {
						{ find = "INSERT" },
						{ find = "VISUAL" },
						{ find = "SELECT" },
						{ find = "TERMINAL" },
					},
				},
				opts = { skip = true },
			},
			{
				view = "notify",
				filter = { event = "msg_showmode" },
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = true,
		},
	},
}
