return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-textobjects" }, -- Syntax aware text-objects
    {
      "nvim-treesitter/nvim-treesitter-context",       -- Show code context
      opts = { enable = true, mode = "topline", line_numbers = true },
    },
  },
  config = function()
    local treesitter = require "nvim-treesitter.configs"

    treesitter.setup {
      ensure_installed = {
        "nix",
        "vim",
        "bash",
        "lua",
        "python",
        "json",
        "javascript",
        "typescript",
        "vue",
        "tsx",
        "yaml",
        "astro",
        "html",
        "http",
        "go",
        "gomod",
        "gowork",
        "csv",
        "css",
        "markdown",
        "svelte",
        "graphql",
        "dockerfile",
        "sql",
        "gitignore",
        "query",
        "vimdoc",
        "mermaid",
        "c",
        "make",
        "comment",
        "rust",
        "toml",
        "nginx",
        "hcl",
        "cmake",
        "hyprlang",
      },
      indent = { enable = true },
      auto_install = true,
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      textobjects = { select = { enable = true, lookahead = true } },
    }
  end,
}
