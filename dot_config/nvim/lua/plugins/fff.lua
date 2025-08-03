-- Always install rust from the official site, not from
-- brew or this plugin build will fail
-- https://www.rust-lang.org/tools/install
return {
	"dmtrKovalenko/fff.nvim",
	build = "cargo build --release",
	config = function()
		local fff = require("fff")
		fff.setup({
			prompt = "> ",
			max_threads = 8,
		})
		vim.keymap.set("n", "<leader><leader>", function()
			vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null")
			if vim.v.shell_error == 0 then
				fff.find_in_git_root()
			else
				fff.find_files()
			end
		end, { desc = "find_files" })
		vim.keymap.set("n", "<leader>sn", function()
			fff.find_files_in_dir("~/notes")
		end, { desc = "notes" })
	end,
}
