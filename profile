if [ "$DISPLAY" ] && command -v lsd; then
    alias ls='lsd -FS --color never'
else
    alias ls='ls -FS'
fi

alias __date='date "+%l:%M %p"'
alias __dir='pwd | sed "s|$HOME|~|"'

PS1='$(__date) $(__dir) \$ '
export EDITOR=/usr/bin/nvim
export TERMINAL=$HOME/bin/st
export BINDIR=$HOME/bin

clear
cal
cat ~/TODO 2> /dev/null
echo

alias make='make -j$(nproc)'
alias loc="find -name '*.[ch]' -exec cat {} \\; | wc -l"

help() {
    command -v "$1" || return
    cmd=$1
    shift
    case $cmd in
        go) go   help "$@" ;;
        *)  $cmd --help "$@" ;;
    esac | ${PAGER:-less}
}

# shellcheck disable=1090
[ -f ~/.cargo/env ] && . ~/.cargo/env

export PATH=$HOME/bin:/usr/local/go/bin:$HOME/go/bin:$HOME/src/scripts:$PATH
