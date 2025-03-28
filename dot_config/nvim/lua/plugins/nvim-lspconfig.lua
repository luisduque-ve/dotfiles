return {
	-- LSP Configuration & Plugins
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		"nvim-tree/nvim-tree.lua",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		--  This function gets run when an LSP connects to a particular buffer.
		--
		--  For some reason the `keys` key used by lazy.nvim is stoping
		--  the lsp to start, I defined a function to create the mappings
		--  and use a `key` table with the same structure used by lazy.nvim
		--
		--  if this is fixed in the future I can remove the function and
		--  just put the `keys` key one level out so lazy.nvim get handle
		--  the keymappings
		local on_attach = function(_, bufnr)
			-- call which key to render the groups only
			local wk = require("which-key")
			wk.add({
				{ "<leader>h", group = "+LSP" },
				{ "<leader>hd", group = "+diagnostics" },
				{ "<leader>hg", group = "+goto" },
				{ "<leader>hs", group = "+server" },
				{ "<leader>hw", group = "+workspace" },
			}, {
				buffer = 0,
			})
			local function create_key_mappings(keys)
				for _, key in ipairs(keys) do
					vim.keymap.set("n", key[1], key[2], { desc = key.desc, buffer = bufnr })
				end
			end
			local keys = {
				{ "<leader>ha", "<CMD>lua vim.lsp.buf.code_action()<CR>", desc = "code_action" },
				{ "<leader>hdf", "<CMD>lua vim.diagnostic.open_float()<CR>", desc = "show_current" },
				{ "<leader>hdn", "<CMD>lua vim.diagnostic.goto_next()<CR>", desc = "next" },
				{ "<leader>hdp", "<CMD>lua vim.diagnostic.goto_prev()<CR>", desc = "previous" },
				{ "<leader>hf", "<CMD>lua vim.lsp.buf.format({async = true})<CR><CMD>w<CR>", desc = "format" },
				{ "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", desc = "lsp_definition" },
				{
					"gi",
					"<CMD>lua vim.lsp.buf.implementation()<CR>",
					desc = "lsp_implementation",
				},
				{
					"gD",
					"<CMD>lua vim.lsp.buf.declaration()<CR>",
					desc = "lsp_declaration",
				},
				{ "gs", "<CMD>lua vim.lsp.buf.signature_help()<CR>", desc = "lsp_signature" },
				{
					"go",
					"<CMD>lua vim.lsp.buf.type_definition()<CR>",
					desc = "lsp_type_definition",
				},
				{ "K", "<CMD>lua vim.lsp.buf.hover()<CR>", desc = "lsp_hover" },
				{ "<F2>", "<CMD>lua vim.lsp.buf.rename()<CR>", desc = "lsp_rename" },
				{ "<leader>hsc", "<CMD>LspStart<CR>", desc = "start" },
				{ "<leader>hsi", "<CMD>LspInfo<CR>", desc = "info" },
				{ "<leader>hsl", "<CMD>LspLog<CR>", desc = "log" },
				{ "<leader>hsr", "<CMD>LspRestart<CR>", desc = "restart" },
				{ "<leader>hss", "<CMD>LspStop<CR>", desc = "stop" },
				{ "<leader>hsu", ":LspUninstall ", desc = "uninstall" },
				{ "<leader>hsx", ":LspInstall ", desc = "install" },
			}
			create_key_mappings(keys)
			-- Lesser used LSP functionality probably never used, that is why is not in the table
			-- bellow, I'll probably remove soon
			vim.keymap.set(
				"n",
				"<leader>hwa",
				vim.lsp.buf.add_workspace_folder,
				{ desc = "add_folder", buffer = bufnr }
			)
			vim.keymap.set(
				"n",
				"<leader>hwr",
				vim.lsp.buf.remove_workspace_folder,
				{ desc = "remove_folder", buffer = bufnr }
			)
			vim.keymap.set("n", "<leader>hwl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, { desc = "list_folders", buffer = bufnr })
		end

		--  Add any additional override configuration in the following tables. They will be passed to
		--  the `settings` field of the server config. You must look up that documentation yourself.
		local servers = {
			clangd = {},
			dockerls = {},
			jsonls = {},
			marksman = {},
			terraformls = {},
			pylsp = {},
			vimls = {},
			yamlls = {},
			lua_ls = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
					diagnostics = {
						-- Get the language server to recognize the `vim` and luasnip globals.
						globals = {
							"vim",
							"s",
							"sn",
							"t",
							"i",
							"f",
							"c",
							"end",
							"d",
							"isn",
							"psn",
							"l",
							"rep",
							"r",
							"p",
							"types",
							"events",
							"util",
							"fmt",
							"ls",
							"ins_generate",
							"parse",
						},
					},
				},
			},
		}

		-- Ensure the servers above are installed
		local mason_lspconfig = require("mason-lspconfig")

		mason_lspconfig.setup({
			ensure_installed = vim.tbl_keys(servers),
		})

		mason_lspconfig.setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = servers[server_name],
				})
			end,
		})
	end,
}
