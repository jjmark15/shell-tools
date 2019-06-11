addtopath() {
  if [[ ":$PATH:" == *":$1:"* ]]; then
    :
  else
    export PATH=$1:$PATH
  fi
}