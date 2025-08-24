return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        {
          "folke/lazydev.nvim",
          ft = "lua", -- only load on lua files
          opts = {
            library = {
              -- See the configuration section for more details
              -- Load luvit types when the `vim.uv` word is found
              { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
          },
        },
      }
    },
    config = function()
      -- Configure diagnostics
      vim.diagnostic.config({
        virtual_text = {
          -- source = "always",  -- Or "if_many"
          prefix = '●', -- Could be '■', '▎', 'x'
        },
        severity_sort = true,
        underline = { severity = vim.diagnostic.severity.ERROR },
        float = {
          border = "rounded",
          source = "always", -- Or "if_many"
        },
      })

      -- Setup format on save
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable format on save for this buffer
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = ev.buf,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end,
      })

      -- Lua LSP
      vim.lsp.enable("lua_ls")

      vim.lsp.enable("clangd")

      vim.lsp.enable("pyright")

      vim.lsp.enable("gopls")
      vim.lsp.config["gopls"] = {
        settings = {
          gopls = {
            semanticTokens = true,
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            staticcheck = true,
            gofumpt = true,
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
      }
    end,
  }
}
