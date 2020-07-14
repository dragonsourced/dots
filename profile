# Aliases.

## Make.

alias m="make -j$(nproc)"
alias m.="make -C.. -j$(nproc)"
alias mc="make clean -j$(nproc)"
alias mc.="make clean -C.. -j$(nproc)"
alias mi="DESTDIR=$HOME make install -j$(nproc)"
alias mi.="DESTDIR=$HOME make install -C.. -j$(nproc)"
alias smi="sudo make install -j$(nproc)"
alias smi.="sudo make install -C.. -j$(nproc)"

## Git.

alias gc='git commit'
alias ga='git commit --amend'
alias gn='git notes add'
alias gl='git log --oneline'
alias gL='git log'

## Editing.

alias e='vi'
alias et='vi -t'
alias ef='vi $(fzf)'
cef() {
	__f=$(fzf)
	cd $(dirname $__f)
	e $(basename $__f)
}

## Misc.

alias ls='git status -sb 2> /dev/null; ls -CFxh'
alias l='ls -l'

alias todo='sed -E '\''s/^[^ ]+:/\x1b[1m&\x1b[0m/'\'' ~/TODO'
alias bc='wcalc -r'

loc() {
	find . -type f\
	    | sed 's/^\.\///'\
	    | grep -ve '^\.' -e '\/\.'\
	    | xargs -d'\n' wc -l
}

# Prompt.

_prompt() {
	{
		date '+%l:%M %p'
		pwd | sed "s|$HOME|~|"
	} | tr '\n' ' '
}
PS1='$(_prompt) \$ '

# Exported variables.

export EDITOR=/usr/bin/vi
export TERMINAL=/usr/bin/uxterm
export BINDIR=$HOME/bin

export PATH=$HOME/bin:/usr/local/go/bin:$HOME/go/bin:$HOME/src/scripts:$PATH
export LESSHISTFILE=/dev/null

# Settings.

set -o vi

# Useful commands, but not so complicated as to
# require a proper shell script.

## Page "cmd --help", especially useful for
## such commands as gcc(1) with its stupidly
## long list of flags.

help() {
    command -v "$1" || return
    cmd=$1
    shift
    case $cmd in
        go) go   help "$@" ;;
        *)  $cmd --help "$@" ;;
    esac | ${PAGER:-less -r}
}

## Create a new virtualenv, if none are found.  If
## one is found, enter it.

venv() {
    if [ -d venv ]; then
        # shellcheck disable=SC1091
        . venv/bin/activate
    else
        virtualenv -p python3 venv
        venv
    fi
}

## Translate from English to French using translate-shell(1)

fr() {
	clear
	trans "$*" -t fr | less -r
}

[ $(tty) = /dev/tty7 ] && exec startx

# Transparency (if available).

[ "$WINDOWID" ]\
 	&& command -v transset > /dev/null\
	&& transset --id "$WINDOWID"\
	"$(theme g termopacity)"\
	> /dev/null

# MOTD

clear
cal
todo
