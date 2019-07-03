shelltoolsdir="${devdir}/shell-tools/"
shelltoolsfname="shell-tools.sh"
shelltoolspath="${shelltoolsdir}${shelltoolsfname}"

source "${shelltoolsdir}/common.sh"

# go ahead and put some snazzy aliases here
alias foo='echo "snazziness epitomised"'
alias cdev='cd ${devdir}'
alias cdd='cdev'
alias emptyf='cat /dev/null > '
alias shredq='shred -uz'
alias refshell='exec $SHELL'

# ls aliases
alias la='ls -lAh'
alias sl='ls'
alias ll='ls -lh'
alias l='ls -lah'

quick_upgrade() {
  command -v apt > /dev/null && sudo apt update && sudo apt -y full-upgrade &&\
    sudo apt autoremove -y
  command -v snap > /dev/null && sudo snap refresh
  command -v flatpak > /dev/null && flatpak update -y
  command -v brew > /dev/null && brew update && brew upgrade -y
}

psaux() {
  ps aux | grep -v grep | egrep -E --color=auto "PID|${1}"
}

update_env_tools() {
  if git -C $shelltoolsdir pull --rebase --stat origin master
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
