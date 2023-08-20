return {
	"iamcco/markdown-preview.nvim",
	ft = "markdown",
	cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	keys = {
		{ "<leader>umc", "<CMD>MarkdownPreview<CR>", desc = "start_preview" },
		{ "<leader>ums", "<CMD>MarkdownPreviewStop<CR>", desc = "stop_preview" },
	},
}
