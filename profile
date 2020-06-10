alias ls='ls -lFShX'

alias __date='date "+%l:%M %p"'
alias __dir='pwd | sed "s|$HOME|~|"'

PS1='$(__date) $(__dir) \$ '
export EDITOR=/usr/bin/nvi
export TERMINAL=$HOME/bin/st
export BINDIR=$HOME/bin

clear
cal
cat ~/TODO 2> /dev/null
echo

alias make='make -j$(nproc)'
alias cloc="find -name '*.[ch]' -exec cat {} \\; | wc -l"
alias pyloc='wc -l $(find -type f | grep -ve pycache -e venv | grep "\.py$") | sed "s/\\.\\///"'

dict() {
    /usr/bin/dict "$@" | ${PAGER:-less}
}

help() {
    command -v "$1" || return
    cmd=$1
    shift
    case $cmd in
        go) go   help "$@" ;;
        *)  $cmd --help "$@" ;;
    esac | ${PAGER:-less}
}

venv() {
    if [ -d venv ]; then
        # shellcheck disable=SC1091
        . venv/bin/activate
    else
        virtualenv -p python3 venv
        venv
    fi
}

# shellcheck disable=1090
[ -f ~/.cargo/env ] && . ~/.cargo/env

export PATH=$HOME/bin:/usr/local/go/bin:$HOME/go/bin:$HOME/src/scripts:$PATH
