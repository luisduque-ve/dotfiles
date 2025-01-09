-- This is the only file that has two plugins in it
-- for me is this is more clear as both are called chezmoi
-- and I have a 1:1 map with plugins names and file names
return {
  {
    "alker0/chezmoi.vim",
    lazy = false,
    init = function()
      -- This option is required.
      vim.g["chezmoi#use_tmp_buffer"] = true
      -- add other options here if needed.
    end,
  },
  {
    'xvzc/chezmoi.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("chezmoi").setup({
        edit = {
          watch = true,
        },
      })
      -- The below configuration wll allow you to automatically
      -- apply changes on files under chezmoi source path.
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = { os.getenv("HOME") .. "/.local/share/chezmoi/*" },
        callback = function(ev)
          local bufnr = ev.buf
          local edit_watch = function()
            require("chezmoi.commands.__edit").watch(bufnr)
          end
          vim.schedule(edit_watch)
        end,
      })
    end
  }
}
