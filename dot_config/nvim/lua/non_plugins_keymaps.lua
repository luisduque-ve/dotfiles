local function map(modes, keybinding, action, description)
  for _, mode in ipairs(modes) do
    local options = { silent = true }
    if description then
      options.desc = description
    end
    vim.keymap.set(mode, keybinding, action, options)
  end
end


-- Do not loose the center ;-)
map({ "n" }, "<C-o>", "<C-o>zz")
map({ "n" }, "<C-i>", "<C-i>zz")
map({ "n" }, "<C-d>", "<C-d>zz")
map({ "n" }, "<C-u>", "<C-u>zz")
map({ "n" }, "n", "nzz")
map({ "n" }, "N", "Nzz")
map({ "n" }, "G", "Gzz")
map({ "n" }, "}", "}zz")
map({ "n" }, "{", "{zz")

-- Quickfix

map({ "n" }, "[q", "<CMD>cprevious<CR>zz", "cprevious")
map({ "n" }, "]q", "<CMD>cnext<CR>zz", "cnext")
map({ "n" }, "[Q", "<CMD>cfirst<CR>zz", "cfirst")
map({ "n" }, "]Q", "<CMD>clast<CR>zz", "clast")

-- buffers
map({ "n" }, "<leader>bc", "<CMD>bufdo bwipeout<CR>", "close_all")
map({ "n" }, "<leader>bd", "<CMD>bd<CR>", "close")
map({ "n" }, "<leader>bo", "<CMD>on<CR>", "only")

-- utils
map({ "n" }, "<leader>un", "<cmd>lua vim.fn.setreg('+', vim.fn.expand('%:t'))<CR>", "yank_filename")

-- others
map({ "n" }, "<leader>l", "<CMD>Lazy<CR>", "lazy")
map({ "n" }, "<leader>gh", "<CMD>!pre-commit run<CR>", "pre_commit")

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", "escape_and_clear_hlsearch")

map({ "n" }, "<C-h>", "<C-w>h", "left_window")
map({ "n" }, "<C-j>", "<C-w>j", "lower_window")
map({ "n" }, "<C-k>", "<C-w>k", "upper_window")
map({ "n" }, "<C-l>", "<C-w>l", "right_window")
