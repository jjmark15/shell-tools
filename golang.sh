###############################
# GOLANG

export GOPATH="$HOME/.go"

if [ ! -d "$GOPATH/bin" ]; then
  mkdir -p "$GOPATH/bin"
fi

if [ ! -d "$GOPATH/src" ]; then
  mkdir -p "$GOPATH/src"
fi

###############################

###############################
# modify the path

addtopath "$HOME/.local/bin"
addtopath "$GOPATH/bin"

###############################