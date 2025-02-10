return {
  'stevearc/quicker.nvim',
  cond = not vim.g.vscode,
  event = "FileType qf",
  ---@module "quicker"
  ---@type quicker.SetupOptions
  opts = {},
}
