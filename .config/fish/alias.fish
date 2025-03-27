# System Aliases
alias ls="eza --icons -gh --group-directories-first"
alias ll="eza --icons -gh --group-directories-first -l"
alias la="eza --icons -gh --group-directories-first -a"
alias lla="eza --icons -gh --group-directories-first -la"
alias llt="eza --icons --group-directories-first -T"
alias cd="z"
alias cdi="zi"
alias ccat="/bin/cat"
alias cat="bat -p -P"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias zshrc="nvim ~/.zshrc"
alias e="cd ~/dotfiles/ && nvim && cd -"
alias a="cd ~/dotfiles/ && stow . && cd -"
alias tf="tail -f -n 1000"

# Misc Aliases
alias lg="lazygit"
alias s="sesh connect \$(sesh list -i | gum filter --limit 1 --no-sort --fuzzy --placeholder 'Pick a sesh' --height 50 --prompt=' ')"
alias start-proxy="python3 ~/scripts/start-proxy.py"
alias kill-proxy="python3 ~/scripts/kill-proxy.py"
alias os-icon="python3 ~/scripts/os-icon.py"

# Docker Aliases
alias drm="docker rm -f \$(docker ps -aq)"
alias drmi="docker rmi -f \$(docker images -aq)"
alias dclean="docker system prune -a"
alias dnuke="drm; drmi; docker system prune -a --volumes --force"
alias d="docker"
alias dc="docker compose"
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dr="docker run"
alias dex="docker exec -it"

# Kubernetes Aliases
alias k="kubectl"
alias kg="kubectl get"
alias kd="kubectl describe"
alias krm="kubectl delete"
alias kaf="kubectl apply -f"
alias klo="kubectl logs -f"
alias kex="kubectl exec -it"
alias kpf="kubectl port-forward"
alias kgi="kubectl get ingress"
alias kgr="kubectl get roles"
alias kga="kubectl get rolebindings"
alias kgc="kubectl get configmaps"
alias kgs="kubectl get secrets"
alias kgn="kubectl get nodes"
alias kdp="kubectl describe pods"
alias kds="kubectl describe services"
alias kdd="kubectl describe deployments"
alias h="helm"
alias hi="helm install"
alias hu="helm uninstall"
alias hl="helm list"
alias hls="helm ls"
alias hld="helm delete"
alias hldp="helm delete --purge"

# Git Aliases
alias g="git"
alias gs="git status"
alias gaa="git add --all"
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gbr="git branch"
alias gpl="git pull"
alias gp="git push"

# Common use
alias grubup="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'                                   # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'          # List amount of -git packages
alias update='sudo pacman -Syu'

# Get fastest mirrors
alias mirror="sudo cachyos-rate-mirrors"

# Help people new to Arch
alias apt='man pacman'
alias apt-get='man pacman'
alias please='sudo'
alias tb='nc termbin.com 9999'

# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
