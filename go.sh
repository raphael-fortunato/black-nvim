#!/bin/bash
set -euo pipefail

check() {
    nvim -u dev.vim
}

build-doc() {
    ./md2vim -notoc -desc 'Format your code using Black' doc/black.md doc/black.txt
    printf 'vim:ft=help:tw=79:ts=4:et:\n' >> doc/black.txt
    nvim doc/black.txt
}


h() {
    echo "$0 <task> [args]"
    echo "Tasks:"
    compgen -A function | cat -n
}

default() {
    check "$@"
}

TIMEFORMAT="Task completed in %3lR"
time ${@:-default}
