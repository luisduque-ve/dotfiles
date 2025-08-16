local g = vim.g
local set = vim.opt
local o = vim.o

g.loaded_netrw = 1 -- this is for nvim-tree.lua
g.loaded_netrwPlugin = 1 -- this is for nvim-tree.lua
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.mapleader = " "
g.maplocalleader = ","
o.grepformat = "%f:%l:%c:%m"
o.grepprg = "rg --vimgrep --no-heading" -- setting grepprg to use ripgrep
o.shell = "/opt/homebrew/bin/fish" -- set default shell
o.timeout = true -- used by which-key but affect other places
o.timeoutlen = 200 -- used by which-key but affect other places
set.autoread = true
set.clipboard = "unnamedplus"
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
vim.opt.shortmess:append("S")
