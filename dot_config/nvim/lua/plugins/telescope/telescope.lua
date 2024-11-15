return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  config = function()
    -- this function dinamycally select the correct
    -- file finder
    function TelescopeFindOrGitFiles()
      local actions = require("telescope.actions")
      -- os.execute runs the command and returns the exit code
      -- 'git rev-parse --is-inside-work-tree' returns 0 if the current directory is a git repository
      if os.execute("git rev-parse --is-inside-work-tree > /dev/null 2>&1") == 0 then
        require("telescope.builtin").git_files({
          use_git_root = false,
          attach_mappings = function(_, map)
            map("i", "<esc>", actions.close)
            return true
          end,
        })
      else
        require("telescope.builtin").find_files({
          attach_mappings = function(_, map)
            map("i", "<esc>", actions.close)
            return true
          end,
        })
      end
    end

    require("telescope").setup({
      defaults = {
        file_ignore_patterns = {
          "__init__.py",
        },
        mappings = {
          i = {
            ["<esc>"] = require("telescope.actions").close,
            ["<C-w>"] = "which_key",
            ["<C-k>"] = require("telescope.actions").move_selection_next,
            ["<C-j>"] = require("telescope.actions").move_selection_previous,
            ["<C-h>"] = require("telescope.actions").select_default,
          },
        },
      },
      extensions = {
        live_grep_args = {
          auto_quoting = true, -- this makes possible the quote_prompt
          mappings = {
            i = {
              ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
              ["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({
                postfix = " --iglob ",
              }),
              ["<esc>"] = function()
                vim.cmd([[stopinsert]])
              end,
            },
          },
        },
      },
    })
  end,
  keys = {
    {
      "<Leader><Leader>",
      "<CMD>lua TelescopeFindOrGitFiles()<CR>",
      desc = "find_files",
    },
    { "<Leader>st", "<CMD>Telescope<CR>",                               desc = "telescope" },
    { "<Leader>gb", "<CMD>Telescope git_branches<CR>",                  desc = "branch" },
    { "<Leader>f",  "<CMD>Telescope filetypes<CR>",                     desc = "filetypes" },
    { "<M-x>",      "<CMD>Telescope commands<CR>",                      desc = "command" },
    { "<Leader>sm", "<CMD>Telescope marks<CR>",                         desc = "marks" },
    { "<Leader>sr", "<CMD>Telescope oldfiles<CR>",                      desc = "recent_files" },
    { "<leader>sb", "<CMD>Telescope buffers<CR>",                       desc = "buffers" },
    { "<leader>sk", "<CMD>Telescope keymaps<CR>",                       desc = "keymaps" },
    { "<leader>ss", "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>", desc = "lsp_symbol" },
  },
}
