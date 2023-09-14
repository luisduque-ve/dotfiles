return {
	"Exafunction/codeium.vim",
	event = "BufEnter",
	cond = function()
		local filename = ".ignoreai"
		return os.rename(filename, filename) and false or true
	end,
	config = function()
		vim.keymap.set("i", "<C-h>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true })
		vim.keymap.set("i", "<c-k>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true })
		vim.keymap.set("i", "<c-j>", function()
			return vim.fn["codeium#CycleCompletions"](-1)
		end, { expr = true })
		vim.keymap.set("i", "<c-x>", function()
			return vim.fn["codeium#Clear"]()
		end, { expr = true })
	end,
}
