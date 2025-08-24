return {
  -- Gruvbox Material theme (better LSP support)
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    lazy = false,
    config = function()
      -- Configure gruvbox-material settings
      vim.g.gruvbox_material_foreground = "mix" -- "material", "mix", "original"
      vim.g.gruvbox_material_style = "hard"     -- "hard", "medium", "soft"
      vim.g.gruvbox_material_background = "dark"
      vim.g.gruvbox_material_ui_contrast = "low"
      vim.g.gruvbox_material_float_style = "dim"

      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_better_performance = 1

      -- Enhanced LSP and diagnostic support
      vim.g.gruvbox_material_diagnostic_text_highlight = 1
      vim.g.gruvbox_material_diagnostic_line_highlight = 1
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"

      -- Transparency support (like your current setup)
      vim.g.gruvbox_material_transparent_background = 2

      -- Better terminal colors and UI elements
      vim.g.gruvbox_material_statusline_style = "material"
      vim.g.gruvbox_material_current_word = "grey background"

      -- Set colorscheme
      vim.cmd.colorscheme("gruvbox-material")
      vim.o.background = "dark"
    end,
  },
}
