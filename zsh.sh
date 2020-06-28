
enable_zsh_completion() {
    if echo $SHELL | grep -q 'zsh'; then
        autoload bashcompinit
        bashcompinit
    fi
}

enable_zsh_completion