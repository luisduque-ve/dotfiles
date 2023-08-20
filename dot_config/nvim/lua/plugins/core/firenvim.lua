return {
	"glacambre/firenvim",
	-- Lazy load firenvim
	-- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
	cond = not not vim.g.started_by_firenvim,
	build = function()
		require("lazy").load({ plugins = "firenvim", wait = true })
		vim.fn["firenvim#install"](0)
	end,

	config = function()
		vim.g.firenvim_config = {
			-- do not trigger unless the shortcut is pressed
			-- https://github.com/glacambre/firenvim#manually-triggering-firenvim
			localSettings = {
				[".*"] = {
					takeover = "never",
				},
			},
		}
	end,
}
