return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = true,
  opts = {
    terminal = {
      snacks_win_opts = {
        keys = {
          nav_left  = { "<C-h>", function() vim.cmd("TmuxNavigateLeft")     end, mode = "t" },
          nav_down  = { "<C-j>", function() vim.cmd("TmuxNavigateDown")     end, mode = "t" },
          nav_up    = { "<C-k>", function() vim.cmd("TmuxNavigateUp")       end, mode = "t" },
          nav_right = { "<C-l>", function() vim.cmd("TmuxNavigateRight")    end, mode = "t" },
          nav_prev  = { "<C-\\>", function() vim.cmd("TmuxNavigatePrevious") end, mode = "t" },
        },
      },
    },
  },
  keys = {
    { "<leader>ac", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
    { "<leader>af", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude" },
    { "<leader>ar", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
    { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>",        mode = "v", desc = "Send to Claude" },
    {
      "<leader>as",
      "<cmd>ClaudeCodeTreeAdd<cr>",
      desc = "Add file",
      ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
    },
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny diff" },
  },
}
