alias ls='git status -sb 2> /dev/null; ls -CshFx'

alias __date='date "+%l:%M %p"'
alias __dir='pwd | sed "s|$HOME|~|"'

PS1='$(__date) $(__dir) \$ '

alias l='ls -l'

alias m=make
alias m.="make -C.. -j$(nproc)"
alias mc="make clean -j$(nproc)"
alias mc.="make clean -C.. -j$(nproc)"
alias mi="DESTDIR=$HOME make install -j$(nproc)"
alias mi.="DESTDIR=$HOME make install -C.. -j$(nproc)"
alias smi="sudo make install -j$(nproc)"
alias smi.="sudo make install -C.. -j$(nproc)"

alias gc='git commit'
alias ga='git commit --amend'
alias gn='git notes add'
alias gl='git log --oneline'
alias gL='git log'

if [ "$DISPLAY" ]; then
	e() {
		xtitle "$*"
		vi "$*"
	}
	et() {
		xtitle "$*"
		vi -t "$*"
	}
else
	alias e='${EDITOR}'
	alias et='e -t'
fi

alias fe='vi $(fzf)'

export EDITOR=/usr/bin/nvi
export TERMINAL=$HOME/bin/st
export BINDIR=$HOME/bin

export PATH=$HOME/bin:/usr/local/go/bin:$HOME/go/bin:$HOME/src/scripts:$PATH

alias make='make -j$(nproc)'
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
    esac | ${PAGER:-less -r}
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

fr() {
	clear
	trans "$*" -t fr | less -r
}

# shellcheck disable=1090
[ -f ~/.cargo/env ] && . ~/.cargo/env

[ "$WINDOWID" ]\
 	&& command -v transset > /dev/null\
	&& transset --id "$WINDOWID"\
	"$(theme g termopacity)"\
	> /dev/null

[ $(tty) = /dev/tty7 ] && exec startx

set -o vi

clear
cal
todo
echo
