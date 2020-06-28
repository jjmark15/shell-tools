if hash exa 2>/dev/null; then
    alias ls='exa'
    alias ll='exa -lh --git'
    alias lla='exa -lah --git'
    alias la='exa -a'
    alias lt='exa -lh --git -I ".git|target|build|node_modules|out" -T'
    alias lta='exa -lah --git -I ".git|target|build|node_modules|out" -T'
fi