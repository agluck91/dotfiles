return {
  "NickvanDyke/opencode.nvim",
  dependencies = { "folke/snacks.nvim", "saghen/blink.cmp" },
  opts = {},
  config = function()
    vim.g.opencode_opts = {
      provider = {
        enabled = "tmux",
        tmux = {
          -- ...
        },
      },
      ask = {
        blink_cmp_sources = {
          default = { "lsp", "path", "snippets", "buffer" },
        },
      },
    }

    vim.keymap.set("n", "<leader>oa", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode…" })
    vim.keymap.set("v", "<leader>oa", function() require("opencode").ask("@selection: ", { submit = true }) end, { desc = "Ask opencode about selection" })
    vim.keymap.set("n", "<leader>ox", function() require("opencode").select() end, { desc = "Execute opencode action…" })
    vim.keymap.set("n", "<leader>ot", function() require("opencode").toggle() end, { desc = "Toggle opencode" })
    vim.keymap.set("n", "<leader>on", function() require("opencode").command "session_new" end, { desc = "New session" })
    vim.keymap.set("n", "<leader>oy", function() require("opencode").command "messages_copy" end, { desc = "Copy last message" })
    vim.keymap.set({ "n", "v" }, "<leader>op", function() require("opencode").select_prompt() end, { desc = "Select prompt" })

    vim.keymap.set("n", "<leader>og", function() return require("opencode").operator "@this " end, { desc = "Add range to opencode", expr = true })
    vim.keymap.set("n", "<leader>ogg", function() return require("opencode").operator "@this " .. "_" end, { desc = "Add line to opencode", expr = true })

    vim.keymap.set("n", "<S-C-u>", function() require("opencode").command "session.half.page.up" end, { desc = "Scroll opencode up" })
    vim.keymap.set("n", "<S-C-d>", function() require("opencode").command "session.half.page.down" end, { desc = "Scroll opencode down" })

    -- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o…".
    vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
    vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
  end,
}
