local plugins = {
  -- theme
  -- {
  --   "Mofiqul/vscode.nvim",
  -- },
  {
    "dreamsofcode-io/chatgpt.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup {
        api_key_cmd = "echo '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'",
      }
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      local rainbow_delimiters = require "rainbow-delimiters.setup"
      rainbow_delimiters.setup.setup {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        priority = {
          [""] = 110,
          lua = 210,
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },
  -- treesitter override
  {
    "andweeb/presence.nvim",
    config = function()
      require("presence").setup {}
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "bash",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "vue",
        "svelte",
        "go",
        "c",
        "cpp",
        "zig",
        "rust",
      },
      auto_install = true,
      indent = { enable = true },
      autotag = {
        enable = true,
      },
    },
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
  },
  -- mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
        "bash-language-server",
        "clangd",
        "json-lsp",
        "lua-language-server",
        "rust-analyzer",
        "typescript-language-server",
        "gopls",
      },
    },
  },

  -- cmp
  {
    "hrsh7th/nvim-cmp",
    opts = {
      completion = {
        completeopt = "menuone,noselect",
      },
    },
  },
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      local base = require "plugins.configs.lspconfig"
      local on_attach = base.on_attach
      local capabilities = base.capabilities

      local lspconfig = require "lspconfig"
      local util = require "lspconfig/util"

      -- clang
      lspconfig.clangd.setup {
        on_attach = function(client, bufnr)
          client.server_capabilities.signatureHelpProvider = false
          on_attach(client, bufnr)
        end,
        capabilities = capabilities,
      }

      -- typescript
      lspconfig.tsserver.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        init_options = {
          preferences = {
            disableSuggestions = true,
          },
        },
      }

      -- golang
      lspconfig.gopls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          completeUnimported = true,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
          },
        },
      }

      --
      lspconfig.html.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "astro", "ejs", "hbs" },
      }

      -- other
      local servers = { "tailwindcss", "vuels", "prismals", "htmx", "astro", "cssls" }
      for _, server in ipairs(servers) do
        lspconfig[server].setup {
          on_attach = on_attach,
          capabilities = capabilities,
        }
      end
    end,
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^3",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
      {
        "lvimuser/lsp-inlayhints.nvim",
        opts = {},
      },
    },
    ft = "rust",
    config = function()
      local on_attach = require("plugins.configs.lspconfig").on_attach
      local capabilities = require("plugins.configs.lspconfig").capabilities

      vim.g.rustaceanvim = {
        tools = {
          inlay_hints = {
            auto = true,
            only_current_line = true,
          },
        },
        server = {
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            ["rust-analyzer"] = {
              diagnostics = {
                enable = false,
              },
            },
          },
        },
      }
    end,
  },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    tag = "stable",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup()
    end,
  },
  -- comment
  {
    "numToStr/Comment.nvim",
    lazy = false,
  },
  --
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
      local null_ls = require "null-ls"

      local format = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      null_ls.setup {
        sources = {
          format.clang_format,
          format.stylua,
          format.prettierd,
          diagnostics.eslint_d.with { -- js/ts linter
            -- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
            condition = function(utils)
              return utils.root_has_file ".eslintrc.js" -- change file extension if you use something else
            end,
          },
        },
        on_attach = function(current_client, bufnr)
          if current_client.supports_method "textDocument/formatting" then
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format {
                  filter = function(client)
                    --  only use null-ls for formatting instead of lsp server
                    return client.name == "null-ls"
                  end,
                  bufnr = bufnr,
                }
              end,
            })
          end
        end,
      }
    end,
  },
}

return plugins
