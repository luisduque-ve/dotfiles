return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	enabled = function()
		if os.getenv("OPENAI_API_KEY") ~= nil then
			return true
		else
			return false
		end
	end,
	opts = {},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{ "<leader>ca", "<CMD>ChatGPTRun add_tests<CR>", mode = { "n", "v" }, desc = "add_tests" },
		{ "<leader>cd", "<CMD>ChatGPTRun docstring<CR>", mode = { "n", "v" }, desc = "docstring" },
		{ "<leader>ce", "<CMD>ChatGPTRun explain_code<CR>", mode = { "n", "v" }, desc = "explain_code" },
		{ "<leader>cf", "<CMD>ChatGPTRun fix_bugs<CR>", mode = { "n", "v" }, desc = "fix_bugs" },
		{ "<leader>cg", "<CMD>ChatGPTRun grammar_correction<CR>", mode = { "n", "v" }, desc = "grammar_correction" },
		{ "<leader>ci", "<CMD>ChatGPTEditWithInstructions<CR>", mode = { "n", "v" }, desc = "edit_with_instructions" },
		{ "<leader>ck", "<CMD>ChatGPTRun keywords<CR>", mode = { "n", "v" }, desc = "keywords" },
		{ "<leader>co", "<CMD>ChatGPTRun optimize_code<CR>", mode = { "n", "v" }, desc = "optimize_code" },
		{ "<leader>cr", "<CMD>ChatGPTRun roxygen_edit<CR>", mode = { "n", "v" }, desc = "roxygen_edit" },
		{ "<leader>cs", "<CMD>ChatGPTRun summarize<CR>", mode = { "n", "v" }, desc = "summarize" },
		{ "<leader>ct", "<CMD>ChatGPTRun translate<CR>", mode = { "n", "v" }, desc = "translate" },
		{
			"<leader>cc",
			"<CMD>ChatGPTRun code_readability_analysis<CR>",
			mode = { "n", "v" },
			desc = "code_readability_analysis",
		},
	},
}