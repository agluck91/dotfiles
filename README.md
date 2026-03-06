# dotfiles

Personal dotfiles for macOS and CachyOS/Arch Linux.

## Shell & Terminal

- **Fish** — greeting via `fastfetch` (OS-aware), `bat` as man pager, `nvim` as default editor
- **Starship** — prompt
- **tmux** — with `sesh` for session management
- **Ghostty** / **Kitty** — terminal emulator configs

## Editor: Neovim

Full Neovim setup with:

- **LSP**, **nvim-dap** (debugging), **treesitter**, **conform** (formatting/linting)
- **Harpoon**, **lazy-git**, **gitsigns**, **illuminate**, **noice**, **snacks**
- **Catppuccin** theme, **barbecue** breadcrumbs, **lualine** statusline
- **Claude** and **OpenCode** plugins for AI-assisted coding

## AI Tools

- **Claude Code** — integrated into Neovim
- **OpenCode** — configured with MCP servers (`context7`, `grep.app`) and custom providers:
  - **Moonshot / Kimi-K2** (remote)
  - **Ollama / qwen3-coder:30b** (local)

## Linux Desktop (Hyprland)

Wayland/Hyprland-based setup:

- **Hyprland**, **HyprPanel**, **Kanshi** (display management)
- **Wofi** / **Rofi** (launchers), **Swaylock** (screen lock)

## Monitoring

- **btop** — system monitor config

## Scripts

| Script | Purpose |
|--------|---------|
| `start-proxy.py` / `kill-proxy.py` | Proxy management |
| `pull_kubeconfig.sh` | Fetch Kubernetes config |
| `snap.py` | Screenshot utility |
| `os-icon.py` | OS icon helper |