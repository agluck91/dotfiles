return {
  "laytan/cloak.nvim",

  config = function()
    require("cloak").setup({
      enabled = true,
      cloak_character = "",
      highlight_group = "Comment",
      patterns = {
        {
          file_pattern = {
            ".env*",
            "wrangler.toml",
            ".dev.vars",
            "*.fish",
            "*.env.fish",
          },
          cloak_pattern = {
            "=.+", -- Normal .env pattern
            { "set%s+(%S+)%s+(.+)", replace = "set %1 " }
          },
        },
      },
    })
  end
}
