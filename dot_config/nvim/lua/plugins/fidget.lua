return {
  -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
  "j-hui/fidget.nvim",
  cond = not vim.g.vscode,
  opts = {},
  event = "VeryLazy",
  tag = "legacy",
}
