addtopath() {
  if [[ ":$PATH:" == *":$1:"* ]]; then
    :
  else
    export PATH=$1:$PATH
  fi
}

#### Example

# shelltoolsdir="$( cd "$( dirname "${BASH_SOURCE:-$0}" )" >/dev/null 2>&1 && pwd )"

# source "${shelltoolsdir}/common.sh"