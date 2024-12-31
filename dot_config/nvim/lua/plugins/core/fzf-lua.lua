return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    local fzf = require("fzf-lua")
    vim.keymap.set("n", "<leader><leader>", function()
      vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null")
      if vim.v.shell_error == 0 then
        fzf.git_files({ cwd = "." })
      else
        fzf.files()
      end
    end, { desc = "find_files" })
  end,
  keys = {
    { "gr",         "<CMD>FzfLua lsp_references<CR>",       desc = "lsp_references" },
    { "<Leader>f",  "<CMD>FzfLua filetypes<CR>",            desc = "filetypes" },
    { "<Leader>sd", "<CMD>FzfLua dap_configurations<CR>",   desc = "dap_configurations" },
    { "<Leader>sf", "<CMD>FzfLua<CR>",                      desc = "fzf-lua" },
    { "<leader>sg", "<CMD>FzfLua live_grep_glob<CR>",       desc = "live_grep", },
    { "<Leader>sm", "<CMD>FzfLua marks<CR>",                desc = "marks" },
    { "<Leader>sr", "<CMD>FzfLua oldfiles<CR>",             desc = "recent_files" },
    { "<leader>sb", "<CMD>FzfLua buffers<CR>",              desc = "buffers" },
    { "<leader>sk", "<CMD>FzfLua keymaps<CR>",              desc = "keymaps" },
    { "<leader>ss", "<CMD>FzfLua lsp_document_symbols<CR>", desc = "lsp_document_symbols" },
    { "<F4>",       "<CMD>FzfLua dap_commands<CR>",         desc = "dap_commands" },
    { "<M-x>",      "<CMD>FzfLua commands<CR>",             desc = "command" },
  },
}
