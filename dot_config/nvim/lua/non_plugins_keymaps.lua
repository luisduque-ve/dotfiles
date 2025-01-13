-- Do not loose the center ;-)
vim.keymap.set({ "n" }, "<C-o>", "<C-o>zz")
vim.keymap.set({ "n" }, "<C-i>", "<C-i>zz")
vim.keymap.set({ "n" }, "<C-d>", "<C-d>zz")
vim.keymap.set({ "n" }, "<C-u>", "<C-u>zz")
vim.keymap.set({ "n" }, "n", "nzz")
vim.keymap.set({ "n" }, "N", "Nzz")
vim.keymap.set({ "n" }, "G", "Gzz")
vim.keymap.set({ "n" }, "}", "}zz")
vim.keymap.set({ "n" }, "{", "{zz")

-- Quickfix
vim.keymap.set({ "n" }, "[q", "<CMD>cprevious<CR>zz", { desc = "cprevious" })
vim.keymap.set({ "n" }, "]q", "<CMD>cnext<CR>zz", { desc = "cnext" })
vim.keymap.set({ "n" }, "[Q", "<CMD>cfirst<CR>zz", { desc = "cfirst" })
vim.keymap.set({ "n" }, "]Q", "<CMD>clast<CR>zz", { desc = "clast" })

-- buffers
vim.keymap.set({ "n" }, "<leader>bc", "<CMD>bufdo bwipeout<CR>", { desc = "close_all" })
vim.keymap.set({ "n" }, "<leader>bd", "<CMD>bd<CR>", { desc = "close" })
vim.keymap.set({ "n" }, "<leader>bo", "<CMD>on<CR>", { desc = "only" })

-- others
vim.keymap.set({ "n" }, "<leader>l", "<CMD>Lazy<CR>", { desc = "lazy" })

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "escape_and_clear_hlsearch" })

vim.keymap.set({ "n" }, "<C-h>", "<C-w>h", { desc = "left_window" })
vim.keymap.set({ "n" }, "<C-j>", "<C-w>j", { desc = "lower_window" })
vim.keymap.set({ "n" }, "<C-k>", "<C-w>k", { desc = "upper_window" })
vim.keymap.set({ "n" }, "<C-l>", "<C-w>l", { desc = "right_window" })
