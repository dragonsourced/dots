if [ "$DISPLAY" ] && command -v lsd; then
    __lscmd='lsd -FS --color never'
else
    __lscmd='ls -FS'
fi

ls() {
    [ "$@" ] || set -- .

    ( cd "$@" && git status -sb 2> /dev/null; )
    $__lscmd "$@"
}

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

help() {
    ( [ "$1" ] && command -v "$1" && [ "$1" != help ] ) || return
    "$1" --help | less
}

export PATH=$HOME/bin:/usr/local/go/bin:$HOME/go/bin:$HOME/src/scripts:$PATH
