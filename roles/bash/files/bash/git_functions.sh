#!/usr/bin/env bash

gacp() {
  git add -A
  git commit -m "$*"
  git push -u origin $(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
}

gacpgh() {
  gacp "$*"
  gh pr create --fill
  gh pr review --approve
  gh pr merge -dm
}

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}
