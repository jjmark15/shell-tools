shelltoolsdir="${devdir}/shell-tools/"
shelltoolsfname="shell-tools.sh"
shelltoolspath="${shelltoolsdir}${shelltoolsfname}"

source "${shelltoolsdir}/common.sh"

alias gitlog='git log --pretty=oneline --abbrev-commit'
alias gitlistmerged='git branch --merged | grep -v "\*"'
alias gitpruneremote='git remote prune origin'

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