local set = vim.opt

vim.api.nvim_create_autocmd("FileType", {
	pattern = "gitcommit",
	callback = function()
		vim.keymap.set("i", "<C-c><C-c>", "<Esc>:wq<CR>", { buffer = true, silent = true })
		vim.keymap.set("n", "<C-c><C-c>", ":wq<CR>", { buffer = true, silent = true })
	end,
})
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("BufRead", {
	-- configure neovim to recognize markdown files
	-- not sure what breaks this in the latest neovim
	-- version, this is going to be probably fixed in
	-- later releases
	pattern = { "*.md", "*.MD" },
	command = "set filetype=markdown",
})

-- Remove auto comments
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "r", "o" })
	end,
})

vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	callback = function()
		vim.opt_local.number = true
		vim.opt_local.relativenumber = true
		local cwd = vim.fn.getcwd()
		local dir_name = vim.fn.fnamemodify(cwd, ":t")
		local bufnr = vim.api.nvim_get_current_buf()
		local new_name = dir_name .. "[term][" .. bufnr .. "]"
		pcall(vim.api.nvim_buf_set_name, bufnr, new_name)
		vim.b.term_title = dir_name
	end,
})

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
	-- Always keep the cursor centered

	pattern = "*",
	callback = function(ctx)
		-- avoid keep center in terminal, is distracting
		if vim.bo[ctx.buf].buftype == "terminal" then
			return
		end

		local line = vim.api.nvim_win_get_cursor(0)[1]

		if vim.b.last_line == nil then
			vim.b.last_line = line
		end

		if line ~= vim.b.last_line then
			local column = vim.fn.getcurpos()[3]
			local mode = vim.api.nvim_get_mode().mode

			vim.cmd("norm! zz")
			vim.b.last_line = line

			if mode:match("^i") then
				vim.fn.cursor({ line, column })
			end
		end
	end,
})
