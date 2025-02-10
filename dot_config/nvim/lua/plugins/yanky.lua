return {
  "gbprod/yanky.nvim",
  cond = not vim.g.vscode,
  event = "VeryLazy",
  config = function()
    require("yanky").setup({
      highlight = {
        timer = 200,
      },
    })
    vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
    vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
    vim.keymap.set("n", "[p", "<Plug>(YankyCycleForward)", { desc = "yanky_forward" })
    vim.keymap.set("n", "]p", "<Plug>(YankyCycleBackward)", { desc = "yanky_backward" })
  end,
}
