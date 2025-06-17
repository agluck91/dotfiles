return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require "harpoon"
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<S-H>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<S-J>", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<S-K>", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<S-L>", function() harpoon:list():select(4) end)
  end,
}
