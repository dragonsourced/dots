# Aliases.

## Make.

alias m="make -j$(nproc)"
alias m.="make -C.. -j$(nproc)"
alias m..="make -C../.. -j$(nproc)"
alias md="make debug -j$(nproc)"
alias md.="make debug -C.. -j$(nproc)"
alias md..="make debug -C../.. -j$(nproc)"
alias mc="make clean -j$(nproc)"
alias mc.="make clean -C.. -j$(nproc)"
alias mc..="make clean -C../.. -j$(nproc)"
alias mi="DESTDIR=$HOME make install -j$(nproc)"
alias mi.="DESTDIR=$HOME make install -C.. -j$(nproc)"
alias mi..="DESTDIR=$HOME make install -C../.. -j$(nproc)"
alias smi="sudo make install -j$(nproc)"
alias smi.="sudo make install -C.. -j$(nproc)"
alias smi..="sudo make install -C../.. -j$(nproc)"

## Git.

alias gc='git commit'
alias ga='git commit --amend'
alias gn='git notes add'
alias gl='git log --oneline'
alias gL='git log'

## Packages.

alias sagi='sudo apt-get install'
alias sagy='sudo apt-get -y install'
alias saga='sudo apt-get autoremove'
alias sagu='sudo apt-get update && sudo apt-get upgrade'
alias apts='apt search'

## Editing.

### https://github.com/n-t-roff/heirloom-ex-vi

alias e='vi'
alias ef='vi $(fzf)'
alias cdf='cd "$(find -type d | fzf)"'
cef() {
	__f=$(fzf)
	cd $(dirname $__f)
	e $(basename $__f)
}

## Misc.

alias ls='git status -sb 2> /dev/null; ls -CFXh'
alias l='ls -l'
alias feh='feh --conversion-timeout 0'
fez() {
	__f=$(fzf)
	feh "$__f" &
}

fep() {
	if [ "$DISPLAY" ]; then
		mpv "$(fzf)"
	else
		mpv --no-video "$(fzf)"
	fi
}

shup() {
	if [ "$DISPLAY" ]; then
		find -type f | shuf | sed 's/"/\\"/g;s/^/"/;s/$/"/' | xargs mpv
	else
		find -type f | shuf | sed 's/"/\\"/g;s/^/"/;s/$/"/' | xargs mpv --no-video
	fi
}

alias todo='sed '\''s/^.*:/\x1b[1m&\x1b[0m/'\'' ~/TODO'
alias lynx='lynx -nopause -collapse_br_tags'
tt() {
	echo "#READ $HOME/.tintin/init.txt" > ~/.tintin/run.txt
	echo "#SESSION MAIN $1 $2" >> ~/.tintin/run.txt
	tt++ ~/.tintin/run.txt
	rm ~/.tintin/run.txt
}

loc() {
	find "${*:-.}" -type f\
	    | sed 's/^\.\///'\
	    | grep -ve '^\.' -e '\/\.'\
	    | xargs -d'\n' wc -l
}

rep() {
	seq 1 $1 | sed "s/.*/$2/" | tr -d '\n'
	echo
}

# Prompt.

_prompt() {
	{
		date '+%l:%M %p '
		pwd | sed "s|$HOME|~|"
	} | tr -d '\n'
}
PS1='$(_prompt) \$ '

# Exported variables.

export EDITOR=/usr/bin/vi
export TERMINAL=/usr/bin/uxterm
export BINDIR=$HOME/bin

export PATH=$HOME/bin:$HOME/usr/local/bin:$HOME/usr/bin:$HOME/src/scripts:/sbin:/usr/sbin:$PATH
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

## If any arguments are provided, act more or less identically
## to sudo.  If none, execute the previous command as root.

please() {
	if [ "$*" ]; then
		sudo "$@"
	else
		sudo $(fc -lnr | sed 1q)
	fi
}

alias pls=please
alias plz=please

[ $(tty) = /dev/tty7 ] && exec sway

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
