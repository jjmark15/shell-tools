# move me to your home directory and source me
# e.g. source "$HOME/.env-tools-setup"


if echo $SHELL | grep -q 'zsh'; then
  autoload bashcompinit
  bashcompinit
fi

export devdir="$HOME/dev"

source "$devdir/shell-tools/shell-tools.sh"

addtopath "$HOME/.local/bin"
addtopath "$HOME/apps"
