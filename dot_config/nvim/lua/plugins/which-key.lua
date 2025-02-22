return {
  "folke/which-key.nvim",
  cond = not vim.g.vscode,
  dependencies = { "echasnovski/mini.icons", "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    local wk = require("which-key")
    wk.add({
      { "<leader>b",  group = "+buffer" },
      { "<leader>c",  group = "+ai",            mode = { "n", "v" } },
      { "<leader>d",  group = "+directory" },
      { "<leader>g",  group = "+git" },
      { "<leader>s",  group = "+search" },
      { "<leader>t",  group = "+test" },
      { "<leader>u",  group = "+utils" },
      { "<leader>uc", group = "+change_case_to" },
      { "<leader>um", group = "+markdown" },
      { "<leader>uw", group = "+window" },
      {
        "<leader>w",
        '<cmd>lua require("which-key").show({keys = "<c-w>", loop=true})<cr>',
        desc = "window",
      },
    })
  end,
}
