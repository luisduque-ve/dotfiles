-- always have the treesitter cli in your node environment
-- npm install -g tree-sitter-cli
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	branch = "main",
	lazy = false,
	config = function()
		local ts = require("nvim-treesitter")
		ts.setup()

		local parsers = {
			"cpp",
			"fish",
			"git_config",
			"git_rebase",
			"gitattributes",
			"gitcommit",
			"gitignore",
			"html",
			"javascript",
			"json",
			"python",
			"rust",
			"svelte",
			"terraform",
			"typescript",
			"yaml",
		}
		local filetypes = {
			"cpp",
			"fish",
			"git_config",
			"git_rebase",
			"gitattributes",
			"gitcommit",
			"gitignore",
			"html",
			"javascript",
			"javascriptreact",
			"json",
			"python",
			"rust",
			"svelte",
			"terraform",
			"typescript",
			"yaml",
		}
		-- Calls `install()` only if there are missing parsers.
		local installed = ts.get_installed()
		local not_installed = vim.tbl_filter(function(parser)
			return not vim.tbl_contains(installed, parser)
		end, parsers)
		if #not_installed > 0 then
			ts.install(not_installed)
		end
		vim.api.nvim_create_autocmd("FileType", {
			pattern = filetypes,
			callback = function()
				-- syntax highlighting, provided by Neovim
				vim.treesitter.start()
				-- folds, provided by Neovim
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				-- indentation, provided by nvim-treesitter
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

				print("treesitter enabled")
			end,
		})
	end,
}
