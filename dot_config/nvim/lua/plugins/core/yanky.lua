return {
  "gbprod/yanky.nvim",
  event = "VeryLazy",
  config = function()
    require("yanky").setup({
      highlight = {
        timer = 200,
      },
    })
    vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
    vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
    vim.keymap.set("n", "]p", "<Plug>(YankyCycleForward)", { desc = "yanky_forward" })
    vim.keymap.set("n", "[p", "<Plug>(YankyCycleBackward)", { desc = "yanky_backward" })
    require("telescope").load_extension("yank_history")
  end,
  keys = {
    { "<leader>sy", "<cmd>Telescope yank_history<cr>", desc = "yank" },
  },
}
