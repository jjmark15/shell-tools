alias k=kubectl
alias kgp='k get pods'
alias kcvm='k config view --minify'

if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi
