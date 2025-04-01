return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  opts = {},
  config = function()
    require("render-markdown").setup {
      file_types = { "markdown", "Avante" },
    }
  end
}
