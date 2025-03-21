return {
  {
    'mfussenegger/nvim-dap'
  },
  {
    'leoluz/nvim-dap-go',
    config = function()
      require('dap-go').setup()
    end
  }
}
