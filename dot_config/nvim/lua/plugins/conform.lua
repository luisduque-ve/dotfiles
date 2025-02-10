return {
  "stevearc/conform.nvim",
  cond = not vim.g.vscode,
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "autoflake", "isort", "darker" },
        terraform = { "terraform_fmt" },
      },
      formatters = {
        autoflake = {
          prepend_args = { "--in-place", "--remove-unused-variables" },
        },
        isort = {
          prepend_args = { "--profile", "black" },
        },
      },
      format_on_save = {
        timeout_ms = 1000,
        lsp_format = "fallback",
      },
    })
  end,
}
