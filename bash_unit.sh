#
# cli-test: Tests for forever CLI
#
# (C) 2012 Nodejitsu Inc.
# MIT LICENSE
#

function fail {
  echo "\033[31m  ✘ $1\033[0m"
  exit 1
}

function success {
  echo "\033[32m  ✔ $1\033[0m"
}

function spec {
  [ $? -eq 0 ] || fail "$1"
  success "$1"
}
