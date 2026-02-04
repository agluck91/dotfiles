
## Source from conf.d before our fish config
source ~/.config/fish/conf.d/done.fish
source ~/.config/fish/alias.fish
## Set values
## Run fastfetch as welcome message
function fish_greeting
    clear 
    # Check if we're on macOS
    if test -f /etc/os-release
        # For Linux systems, use /etc/os-release
        set os_id (grep '^ID=' /etc/os-release | cut -d'=' -f2)
    else
        # For macOS, use sw_vers
        set os_id (sw_vers -productName)
    end

    # Check for "cachyos" in the os_id
    if string match -q "cachyos" $os_id
        fastfetch --logo arch --logo-padding-top 2 --logo-padding-left 2
    else
        fastfetch
    end
end

# Start ssh-agent if not already running
if not set -q SSH_AGENT_PID
    eval (ssh-agent -c) >/dev/null
    ssh-add ~/.ssh/id_ed25519 ^/dev/null
end

# Format man pages
set -x MANROFFOPT "-c"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

# Set default editor
set -gx EDITOR nvim
set -gx VISUAL nvim

## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
  source ~/.fish_profile
end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Add depot_tools to PATH
if test -d ~/Applications/depot_tools
    if not contains -- ~/Applications/depot_tools $PATH
        set -p PATH ~/Applications/depot_tools
    end
end

if test (uname) = "Darwin"
    set -gx PATH /opt/homebrew/bin $PATH  # For Apple Silicon
    set -gx PATH /opt/hombrew/sbin $PATH
    # set -gx PATH /usr/local/bin $PATH  # Uncomment for Intel Macs
end

set -Ux PYENV_ROOT $HOME/.pyenv
set -Ux fish_user_paths $PYENV_ROOT/bin $fish_user_paths

status --is-interactive; and source (pyenv init --path | psub)
## Functions
# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Fish command history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end

# Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
        set from (echo $argv[1] | trim-right /)
        set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end


starship init fish | source
zoxide init fish | source
atuin init fish | source

set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional
carapace _carapace | source
# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# opencode
fish_add_path /Users/agluck/.opencode/bin
set -x JAVA_HOME /usr/lib/jvm/java-17-openjdk/

# Android development environment
set -x ANDROID_HOME $HOME/Android/Sdk
set -x ANDROID_SDK_ROOT $HOME/Android/Sdk
set -x PATH $PATH $ANDROID_HOME/emulator $ANDROID_HOME/platform-tools
set -x QT_QPA_PLATFORM xcb

# opencode
fish_add_path /home/agluck/.opencode/bin
