alias k=kubectl
alias kgp='k get pods'

if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi
