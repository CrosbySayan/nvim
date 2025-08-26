return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    {
      'echasnovski/mini.icons',
      config = function()
        require('mini.icons').setup()
        -- Make mini.icons compatible with nvim-web-devicons API
        MiniIcons.mock_nvim_web_devicons()
      end
    }
  },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'gruvbox-material',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'filename', 'diagnostics' },
        lualine_x = {
          -- Simple LSP indicator
          {
            function()
              local clients = vim.lsp.get_clients()
              if next(clients) == nil then
                return ''
              end
              return ' LSP'
            end,
            color = { fg = '#a9b665' }, -- Green color when active
          },
          'filetype'
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
    }
  end
}
