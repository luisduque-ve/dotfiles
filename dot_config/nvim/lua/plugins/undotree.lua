return {
  "jiaoshijie/undotree",
  cond = not vim.g.vscode,
  dependencies = "nvim-lua/plenary.nvim",
  config = true,
  keys = {
    { "<leader>uu", "<cmd>lua require('undotree').toggle()<cr>", desc = "undotree" },
  },
}
