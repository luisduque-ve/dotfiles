return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"rcarriga/cmp-dap",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
			sources = {
				{ name = "dap" },
			},
		})

		cmp.setup.filetype({ "yaml" }, {
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup({
			enabled = function()
				return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
			end,
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-h>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<C-k>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_locally_jumpable() then
						-- luasnip.expand_or_jump()
						-- jump and expand has manny issues in python
						-- import statements
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<C-j>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = {
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "path" },
			},
			formatting = {
				format = lspkind.cmp_format({
					-- show only symbol annotations
					mode = "symbol",
					-- prevent the popup from showing more than
					-- provided characters
					-- (e.g 50 will not show more than 50 characters)
					maxwidth = 50,
					-- when popup menu exceed maxwidth,
					-- the truncated part would show
					-- ellipsis_char instead (must define maxwidth first)
					ellipsis_char = "...",

					-- The function below will be called before
					-- any actual modifications from lspkind
					-- so that you can provide more controls on popup customization.
					-- (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
					before = function(entry, vim_item)
						return vim_item
					end,
				}),
			},
		})
	end,
}
