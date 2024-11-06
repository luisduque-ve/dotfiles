return {
  "andythigpen/nvim-coverage",
  ft = "python", -- only working with python right now
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("coverage").setup({})
  end,
  keys = {
    { "<leader>tc", "<CMD>Coverage<CR><CMD>CoverageSummary<CR>", desc = "coverage" },
  },
}
