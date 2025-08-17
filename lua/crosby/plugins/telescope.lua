return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "echasnovski/mini.icons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    -- Setup telescope with extensions
    telescope.setup({
      defaults = {
        layout_config = {
          preview_cutoff = 0,
        },
        -- Add any default configurations here
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next,     -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      pickers = {

      },
      extensions = {
        fzf = {}
      }
    })

    telescope.load_extension("fzf")
    -- set keymaps
    local keymap = vim.keymap

    keymap.set("n", "<leader>ff", require('telescope.builtin').find_files, { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", require('telescope.builtin').oldfiles, { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", require('telescope.builtin').live_grep, { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fi", require('telescope.builtin').grep_string, { desc = "Find string under cursor in cwd" })

    keymap.set("n", "<leader>ft", require('telescope.builtin').diagnostics, { desc = "Search man pages" })
    keymap.set("n", "<leader>fm", require('telescope.builtin').man_pages, { desc = "Search man pages" })
    -- TODO:
    -- Man Page Support
    -- Error Call
    -- Spell suggesiton
  end,
}
