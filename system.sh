# go ahead and put some snazzy aliases here
alias emptyf='cat /dev/null > '
alias shredq='shred -uz'

# ls aliases
alias la='ls -lAh'
alias sl='ls'
alias ll='ls -lh'
alias l='ls -lah'

psaux() {
  ps aux | grep -v grep | egrep -E --color=auto "PID|${1}"
}

mkcd() {
  mkdir $1 && cd $1
}

quick_upgrade() {
  if [[ "$OSTYPE" == linux-* ]]; then
    command -v apt > /dev/null && sudo apt update && sudo apt -y full-upgrade &&\
      sudo apt autoremove -y
    command -v snap > /dev/null && sudo snap refresh
    command -v flatpak > /dev/null && flatpak update -y
          # ...
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    command -v brew > /dev/null && brew update > /dev/null && brew upgrade
  fi
}