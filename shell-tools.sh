# go ahead and put some snazzy aliases here
alias foo='echo "snazziness epitomised"'
alias cdev='cd ${devdir}'
alias cdd='cdev'
alias emptyf='cat /dev/null > '
alias shredq='shred -uz'
alias quick_upgrade='sudo apt update && sudo apt -y full-upgrade && sudo apt autoremove -y && sudo snap refresh'
alias apty='sudo apt install -y'
alias refshell='exec $SHELL'

alias prettyjson='python -m json.tool'
alias cls='printf "\033c"'
alias gitlog='git log --pretty=oneline --abbrev-commit'
alias gitlistmerged='git branch --merged | grep -v "\*"'
alias gitpruneremote='git remote prune origin'

# ls aliases
alias la='ls -lAh'
alias sl='ls'
alias ll='ls -lh'
alias l='ls -lah'

shelltoolsfname="shell-tools.sh"
envtooldir="${devdir}/shell-tools/"
shelltoolspath="${envtooldir}${shelltoolsfname}"

export PIPENV_VENV_IN_PROJECT="true"

activate_venv() {
  if [ -d "./venv" ]; then
    source ./venv/bin/activate
  fi
  if [ -d "./.venv" ]; then
    source ./.venv/bin/activate
  fi
}

update_env_tools() {
  if git -C $envtooldir pull --rebase --stat origin master
  then
    echo "Updated env tools"
  else
    echo "Update failed"
  fi
  source $shelltoolspath
}

# shell functions below
shelledit() {
  if [ $# -eq 0 ]
    then
      vim $shelltoolspath && source $shelltoolspath
  else
    vim $1 && source $1
  fi
}

mkcd() {
  mkdir $1 && cd $1
}

addtopath() {
  if [[ ":$PATH:" == *":$1:"* ]]; then
    :
  else
    export PATH=$1:$PATH
  fi
}

catjson() {
  cat "$1" | python3 -m json.tool
}

prettifyjson() {
  cleanjson=$(cat $1 | python3 -m json.tool)
  echo "${cleanjson}" > $1
}

gitc() {
  CHANGED=$(git status --porcelain)
  if [ -n "${CHANGED}" ]; then
    echo 'repo has changes - aborting.';
  else
    basebranch=${1:-master}
    git checkout $basebranch
  fi
}

shouldirebase() {
  CHANGED=$(git status --porcelain)
  if [ -n "${CHANGED}" ]; then
    echo 'repo has changes - aborting.';
  else
    basebranch=${1:-master}
    git checkout $basebranch > /dev/null 2>&1 && git pull > /dev/null 2>&1 && git checkout - > /dev/null 2>&1
    brnch=$(git branch | grep \* | cut -d ' ' -f2)
    hash1=$(git show-ref --heads -s ${basebranch})
    hash2=$(git merge-base ${basebranch} ${brnch})
    [ "${hash1}" = "${hash2}" ] && echo "Rebase required: false" || echo "Rebase required: true"
  fi
}

# our handler that returns choices by populating Bash array COMPREPLY
# (filtered by the currently entered word ($2) via compgen builtin)
_gitpull_complete() {
    branches=$(git branch -l | cut -c3-)
    COMPREPLY=($(compgen -W "$branches" -- "$2"))
}

# we now register our handler to provide completion hints for the "gitpull" command
complete -F _gitpull_complete shouldirebase
complete -F _gitpull_complete gitc

# Checkout master and delete the branch you were on previously.
deletebranch () {
  BRANCH=$(git branch | sed -nr 's/\*\s(.*)/\1/p')
  git checkout master
  git branch -D $BRANCH
}

###############################
# GOLANG

export GOPATH="$HOME/go"

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