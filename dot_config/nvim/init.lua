local g = vim.g
local set = vim.opt

-- enable experimental ui
require("vim._extui").enable({})

-- set default shell
vim.o.shell = "/opt/homebrew/bin/fish"

-- this is for nvim-tree.lua
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
set.termguicolors = true
-- end of nvim-tree.lua requirements

g.mapleader = " "
g.maplocalleader = ","

-- diff options
set.diffopt:append("iwhiteall")

g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0

-- Indentation
--
-- tabstop controls how many spaces a tab character (\t) appears as.
-- In this case, every time you press the tab key or insert a tab character,
-- it will be displayed as if it's 2 spaces wide in the editor.
-- However, it's still a tab character in the file itself
set.tabstop = 2

-- shiftwidth is the number of spaces used for each level of indentation.
-- So when you indent or de-indent lines (like pressing > or < in normal mode),
-- it will change the indentation by 2 spaces
set.shiftwidth = 2

-- softtabstop is how many spaces a tab key press counts for when
-- you're entering text. It works together with expandtab setting.
-- When expandtab is set, pressing tab will actually insert spaces,
-- and softtabstop will control how many spaces to insert
set.softtabstop = 2

-- expandtab determines whether the tab key inserts tab characters
-- or spaces. When expandtab is true (as it is in this case),
-- pressing the tab key will insert spaces instead of a tab character
set.expandtab = true

set.mouse = ""
set.cursorline = true

-- relative line numbers
set.number = true
set.relativenumber = true

-- clipboard config
set.clipboard = "unnamedplus"

set.autoread = true

-- this enable letters autoincrementing
set.nrformats = "bin,hex,alpha"

set.shortmess = "atI"

vim.opt.shortmess:append("S")

set.confirm = true

-- setting grepprg to use ripgrep
vim.o.grepprg = "rg --vimgrep --no-heading"
vim.o.grepformat = "%f:%l:%c:%m"

-- this is used by which-key mainly but is used in other plugins as well
vim.o.timeout = true
vim.o.timeoutlen = 200

-- set global status line
set.laststatus = 3

set.colorcolumn = "70"

-- configure neovim to recognize markdown files
-- not sure what breaks this in the latest neovim
-- version, this is going to be probably fixed in
-- later releases

vim.api.nvim_create_autocmd("BufRead", {
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
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
	end,
})

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
