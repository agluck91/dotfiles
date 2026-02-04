return {
    "catppuccin/nvim",
    name = "catppuccin",
    -- Updated to latest version for blink.cmp support
    enabled = true,
    priority = 1000,
    config = function()
        vim.opt.termguicolors = true

        local catppuccin = require("catppuccin")

        catppuccin.setup({
            transparent_background = true,
            flavour = "mocha",
            term_colors = true,
            styles = {
                conditionals = {},
                functions = {"italic"},
                types = {"bold"}
            },
            highlight_overrides = {
                mocha = function(C)
                    return {
                        NvimTreeNormal = {bg = C.none},
                        Pmenu = {bg = C.none},
                        NormalFloat = {bg = C.none},
                        TelescopeBorder = {link = "FloatBorder"}
                    }
                end
            },
            integrations = {
                barbar = true,
                blink_cmp = true,
                gitsigns = true,
                native_lsp = {enabled = true},
                nvimtree = true,
                telescope = true,
                treesitter = true,
                indent_blankline = {
                    enabled = true,
                    scope_color = "blue",
                    colored_indent_levels = true,
                }
            }
        })

        vim.cmd.colorscheme("catppuccin")
    end
}
