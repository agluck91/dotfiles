return {
    "rose-pine/neovim",
    name = "rose-pine",
    enabled = false,
    priority = 1000,
    config = function()
        vim.opt.termguicolors = true

        require("rose-pine").setup({
            variant = "main",
            dark_variant = "main",
            disable_background = true,
            styles = {
                italic = true,
                bold = true,
                transparency = true,
            },
        })

        vim.cmd.colorscheme("rose-pine")
    end
}
