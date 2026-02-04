return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    -- Show breadcrumbs in the winbar (top of each window)
    attach_navic = true,
    create_autocmd = true,

    -- Theme integration
    theme = "catppuccin",

    -- Show context from LSP
    show_dirname = true,
    show_basename = true,
    show_modified = true,

    -- Symbols configuration (uses LSP document symbols)
    kinds = {
      File = "󰈔",
      Module = "󰅩",
      Namespace = "󰦮",
      Package = "󰆦",
      Class = "󱡠",
      Method = "󰊕",
      Property = "󰖷",
      Field = "󰜢",
      Constructor = "󰒓",
      Enum = "󰦨",
      Interface = "󱡠",
      Function = "󰊕",
      Variable = "󰆦",
      Constant = "󰏿",
      String = "󰉿",
      Number = "󰎠",
      Boolean = "󰨙",
      Array = "󱡠",
      Object = "󰅩",
      Key = "󰌆",
      Null = "󰟢",
      EnumMember = "󰦨",
      Struct = "󱡠",
      Event = "󱐋",
      Operator = "󰪚",
      TypeParameter = "󰬛",
    },

    -- Exclude certain filetypes
    exclude_filetypes = { "netrw", "toggleterm", "opencode" },

    -- Show context separator
    context_follow_icon_color = true,
    lead_custom_section = function()
      return " "
    end,
  },
}
