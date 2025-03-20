return {
	"unblevable/quick-scope",
	init = function()
		-- uncomment the following will trigger quickscope only on f and t
		-- vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
		vim.cmd([[
      augroup qs_colors
        autocmd!
        autocmd ColorScheme * highlight QuickScopePrimary guifg='#af3a03' gui=underline ctermfg=124 cterm=underline
        autocmd ColorScheme * highlight QuickScopeSecondary guifg='#7c6f64' gui=underline ctermfg=59 cterm=underline
      augroup END
    ]])
		vim.g.qs_highlight_on_keys = { "f", "F" }
	end,
	event = "VeryLazy",
}
