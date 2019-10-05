# move me to your home directory and source me
# e.g. source "$HOME/.env-tools-setup"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if echo $SHELL | grep -q 'zsh'; then
  autoload bashcompinit
  bashcompinit
fi

export devdir="$HOME/dev"
export shelltoolsdir="${devdir}/shell-tools/"

source "$shelltoolsdir/shell-tools.sh"
source "$shelltoolsdir/git.sh"
source "$shelltoolsdir/golang.sh"
source "$shelltoolsdir/python.sh"
source "$shelltoolsdir/k8.sh"

addtopath "$HOME/apps"