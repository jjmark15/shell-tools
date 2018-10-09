# move me to your home directory and source me
# e.g. source "$HOME/.env-tools-setup"

autoload bashcompinit
bashcompinit

export devdir="$HOME/dev"
# export devdir="/mnt/c/Users/user/dev"

source "$devdir/bash-tools/bash-tools.sh"

addtopath "$HOME/.local/bin"
addtopath "$HOME/apps"
