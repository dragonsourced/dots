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

help() {
    command -v "$1" || return
    "$1" --help | less
}

homewort set no

export PATH=$HOME/bin:/usr/local/go/bin:$HOME/go/bin:$HOME/src/scripts:$PATH
