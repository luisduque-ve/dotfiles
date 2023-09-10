local function map(modes, keybinding, action, description)
	for _, mode in ipairs(modes) do
		local options = { silent = true }
		if description then
			options.desc = description
		end
		vim.keymap.set(mode, keybinding, action, options)
	end
end

-- Return to normal mode from terminal mode
-- this is only confortable because I use
-- home rows and a tumb cluster, if you're
-- reading this and has an standard keyboard
-- avoid this mapping
map({ "t" }, "<C-esc>", "<C-\\><C-n>")

-- Scroll without loosing the cursor
map({ "n" }, "<C-d>", "<C-d>zz")
map({ "n" }, "<C-u>", "<C-u>zz")
map({ "n" }, "n", "nzz")
map({ "n" }, "N", "Nzz")
map({ "n" }, "G", "Gzz")

-- Windows mappings
map({ "n" }, "<leader>-", "<CMD>split<CR>", "split")
map({ "n" }, "<leader>|", "<CMD>vsplit<CR>", "vsplit")

-- Resize window using <ctrl> arrow keys
map({ "n" }, "<leader>uwk", "<cmd>resize +5<cr>", "height+")
map({ "n" }, "<leader>uwj", "<cmd>resize -5<cr>", "height-")
map({ "n" }, "<leader>uwh", "<cmd>vertical resize -5<cr>", "width-")
map({ "n" }, "<leader>uwl", "<cmd>vertical resize +5<cr>", "width+")

-- change to previous directory
map({ "n" }, "<leader>p", "<CMD>cd -<CR><CMD>pwd<CR>", "cd-")

-- buffers
map({ "n" }, "<leader>bc", "<CMD>bufdo bwipeout<CR>", "close_all")
map({ "n" }, "<leader>bd", "<CMD>bd<CR>", "close")
map({ "n" }, "<leader>bo", "<CMD>on<CR>", "only")

-- utils
map({ "n" }, "<leader>un", "<cmd>lua vim.fn.setreg('+', vim.fn.expand('%:t'))<CR>", "yank_filename")

-- others
map({ "n" }, "<leader>l", "<CMD>Lazy<CR>", "lazy")
map({ "n" }, "<leader>gh", "<CMD>!pre-commit run<CR>", "pre_commit")
map({ "n" }, "<leader>ss", ":grep ", ":grep ")
map({ "n" }, ",,", ",", ",")

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", "escape_and_clear_hlsearch")
