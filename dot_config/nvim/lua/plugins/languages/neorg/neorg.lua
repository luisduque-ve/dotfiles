return {
	"nvim-neorg/neorg",
	build = ":Neorg sync-parsers",
	event = "BufEnter *.neorg",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.integrations.telescope"] = {},
				["core.concealer"] = {}, -- Adds pretty icons to your documents
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							notes = "~/.notes",
						},
						default_workspace = "notes",
					},
				},
			},
		})
		-- this makes URLs links looks better
		vim.cmd([[
      augroup my_conceal_settings
      autocmd!
      autocmd FileType norg setlocal conceallevel=3
      augroup END
      ]])
		-- this render which-key descriptions only for norg files
		-- I'm also redefining some keybindings to keep
		-- consistent with snake_case in which_key
		vim.cmd("autocmd FileType norg lua SetKeybinds()")
		function SetKeybinds()
			local fileTy = vim.api.nvim_buf_get_option(0, "filetype")
			local opts = { prefix = "<localleader>", buffer = 0 }

			if fileTy == "norg" then
				require("which-key").register({
					["n"] = {
						name = "+notes",
					},
					["i"] = {
						name = "+insert",
					},
					["m"] = {
						name = "+modes",
					},
					["l"] = {
						name = "+lists",
					},
					["r"] = { "<cmd>Neorg return<cr>", "return" },
					["c"] = { "<cmd>Neorg toggle-concealer<cr>", "toggle_concealer" },
					["t"] = {
						name = "+todos",
						["a"] = {
							"<cmd>Neorg keybind norg core.qol.todo_items.todo.task_ambigous<cr>",
							"mark_ambigous",
						},
						["c"] = {
							"<cmd>Neorg keybind norg core.qol.todo_items.todo.task_cancelled<cr>",
							"mark_cancelled",
						},
						["d"] = { "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_done<cr>", "mark_done" },
						["h"] = { "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_on_hold<cr>", "mark_on_hold" },
						["i"] = {
							"<cmd>Neorg keybind norg core.qol.todo_items.todo.task_important<cr>",
							"mark_important",
						},
						["p"] = { "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_pending<cr>", "mark_pending" },
						["r"] = {
							"<cmd>Neorg keybind norg core.qol.todo_items.todo.task_recurring<cr>",
							"mark_recurring",
						},
						["u"] = { "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_undone<cr>", "mark_undone" },
					},
				}, opts)
			end
		end
	end,
	keys = {
		-- leave commented only for reference
		-- { "<leader>sw", "<CMD>Telescope neorg switch_workspace<CR>", desc = "neorg_workspace" },
		{ "<leader>sn", "<CMD>Telescope neorg find_norg_files<CR>", desc = "norg_files" },
		{ "<leader>us", "<CMD>Neorg sync-parsers<CR>", desc = "sync_neorg_parsers" },
	},
}
