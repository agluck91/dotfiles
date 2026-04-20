local function nav(wincmd_dir, tmux_dir)
  return function()
    local cur = vim.api.nvim_get_current_win()
    vim.cmd("wincmd " .. wincmd_dir)
    if vim.api.nvim_get_current_win() == cur then
      vim.fn.jobstart("tmux select-pane -" .. tmux_dir, { detach = true })
    end
  end
end

return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = true,
  opts = {
    terminal = {
      snacks_win_opts = {
        keys = {
          nav_left  = { "<C-h>", nav("h", "L"), mode = "t" },
          nav_down  = { "<C-j>", nav("j", "D"), mode = "t" },
          nav_up    = { "<C-k>", nav("k", "U"), mode = "t" },
          nav_right = { "<C-l>", nav("l", "R"), mode = "t" },
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
