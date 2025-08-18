local g = vim.g
local set = vim.opt
local o = vim.o

g.have_nerd_font = true
g.loaded_netrw = 1 -- this is for nvim-tree.lua
g.loaded_netrwPlugin = 1 -- this is for nvim-tree.lua
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.mapleader = " "
g.maplocalleader = " "
o.grepformat = "%f:%l:%c:%m"
o.grepprg = "rg --vimgrep --no-heading" -- setting grepprg to use ripgrep
o.ignorecase = true
o.shell = "/opt/homebrew/bin/fish" -- set default shell
o.signcolumn = "yes"
o.smartcase = true
o.timeout = true -- used by which-key but affect other places
o.timeoutlen = 200 -- used by which-key but affect other places
o.undofile = true
set.autoread = true
set.colorcolumn = "70"
set.confirm = true
set.cursorline = true
set.diffopt:append("iwhiteall") -- diff options
set.expandtab = true
set.laststatus = 3 -- set global status line
set.mouse = ""
set.nrformats = "bin,hex,alpha" -- this enable letters autoincrementing
set.number = true
set.relativenumber = true -- relative line numbers
set.shiftwidth = 2
set.shortmess = "atI"
set.softtabstop = 2
set.tabstop = 2
set.termguicolors = true -- this is for nvim-tree.lua
vim.opt.shortmess:append("SF")

vim.schedule(function()
	set.clipboard = "unnamedplus"
end)

local function status_line()
	local mode = " %-5{%v:lua.string.upper(v:lua.vim.fn.mode())%}"
	local file_name = "%-.100t"
	local modified = " %-m"
	local file_type = " ft=%y"
	local right_align = "%="
	local pct_thru_file = "%5p%% "

	return string.format("%s%s%s%s%s%s", mode, file_name, modified, file_type, right_align, pct_thru_file)
end

vim.opt.statusline = status_line()

require("autocmds")

require("vim._extui").enable({}) -- enable experimental ui

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
vim.keymap.set({ "n" }, "<leader>l", "<CMD>Lazy<CR>", { desc = "Lazy" })

vim.diagnostic.config({
	virtual_text = { current_line = false },
})

vim.lsp.enable({
	"clangd",
	"json",
	"luals",
	"pyright",
	"tsserver",
})

require("keymaps")
