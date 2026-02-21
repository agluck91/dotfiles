return {
  {
    "williamboman/mason.nvim",
    config = function() require("mason").setup() end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      -- Set up default capabilities for all LSP servers using the new vim.lsp.config API
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- Configure lua_ls specifically for Neovim development
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT", -- Neovim uses LuaJIT
            },
            diagnostics = {
              globals = { "vim" }, -- Recognize 'vim' global
            },
            workspace = {
              library = {
                vim.env.VIMRUNTIME,    -- Neovim runtime files
                "${3rd}/luv/library",  -- Full Neovim API definitions
              },
              checkThirdParty = false, -- Don't ask about configuring luassert/busted
            },
            telemetry = {
              enable = false, -- Don't send telemetry
            },
          },
        },
      })

      -- Set up LSP keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local opts = { buffer = bufnr, silent = true }
          vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "LSP Hover" }))
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to Definition" }))
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration,
            vim.tbl_extend("force", opts, { desc = "Go to Declaration" }))
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation,
            vim.tbl_extend("force", opts, { desc = "Go to Implementation" }))
          vim.keymap.set("n", "gy", vim.lsp.buf.type_definition,
            vim.tbl_extend("force", opts, { desc = "Go to Type Definition" }))
          vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "List References" }))
          vim.keymap.set("n", "<C-S-k>", vim.lsp.buf.signature_help,
            vim.tbl_extend("force", opts, { desc = "Signature Help" }))
          vim.keymap.set("i", "<C-S-k>", vim.lsp.buf.signature_help,
            vim.tbl_extend("force", opts, { desc = "Signature Help" }))
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename Symbol" }))
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action,
            vim.tbl_extend("force", opts, { desc = "Code Action" }))
          vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format { async = true } end,
            vim.tbl_extend("force", opts, { desc = "Format Document" }))
        end,
      })

      -- Mason-lspconfig will automatically enable installed servers via vim.lsp.enable()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "rust_analyzer",
          "emmet_ls",
          "tailwindcss",
          "cssls",
          "dockerls",
          "docker_compose_language_service",
          "gopls",
          "helm_ls",
          "jsonls",
          "lua_ls",
          "remark_ls",
          "mdx_analyzer",
          "nginx_language_server",
          "jedi_language_server",
          "bashls",
          "terraformls",
          "tflint",
          "eslint",
          "ts_ls",
          "yamlls",
          "jinja_lsp",
          "ast_grep",
          "awk_ls",
          "astro",
          "arduino_language_server",
          "lemminx",
        },
      }
    end,
  },
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "L3MON4D3/LuaSnip",
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- Use 'default' preset for familiar keymaps (matches your nvim-cmp setup)
      keymap = { preset = "default" },

      -- Snippets configuration with LuaSnip
      snippets = {
        preset = "luasnip",
      },

      completion = {
        -- Show documentation automatically when selecting items
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        menu = {
          border = "rounded",
          draw = {
            -- Icon next to the word (more like nvim-cmp default)
            columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
          },
        },
        -- Trigger completion automatically
        trigger = {
          show_on_insert_on_trigger_character = true,
        },
      },

      -- Enable icons and kind formatting
      appearance = {
        nerd_font_variant = "mono",
        kind_icons = {
          Text = "󰉿",
          Method = "󰊕",
          Function = "󰊕",
          Constructor = "󰒓",

          Field = "󰜢",
          Variable = "󰆦",
          Property = "󰖷",

          Class = "󱡠",
          Interface = "󱡠",
          Struct = "󱡠",
          Module = "󰅩",

          Unit = "󰪚",
          Value = "󰦨",
          Enum = "󰦨",
          EnumMember = "󰦨",

          Keyword = "󰻾",
          Constant = "󰏿",

          Snippet = "󱄽",
          Color = "󰏘",
          File = "󰈔",
          Reference = "󰬲",
          Folder = "󰉋",
          Event = "󱐋",
          Operator = "󰪚",
          TypeParameter = "󰬛",
          Copilot = "",
        },
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
          path = {
            opts = {
              show_hidden_files_by_default = true,
            },
          },
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100, -- Boost copilot suggestions
            async = true,
            transform_items = function(_, items)
              local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
              local kind_idx = #CompletionItemKind + 1
              CompletionItemKind[kind_idx] = "Copilot"
              for _, item in ipairs(items) do
                item.kind = kind_idx
              end
              return items
            end,
          },
        },
      },

      -- Signature help (similar to nvim-cmp signature help)
      signature = {
        enabled = true,
      },
    },
    opts_extend = { "sources.default" },
  },
}
