export PIPENV_VENV_IN_PROJECT="true"

activate_venv() {
  if [ -d "./venv" ]; then
    source ./venv/bin/activate
  fi
  if [ -d "./.venv" ]; then
    source ./.venv/bin/activate
  fi
}

pyenv() {
  eval "$(command pyenv init -)"
  eval "$(command pyenv virtualenv-init -)"
  pyenv "$@"
}