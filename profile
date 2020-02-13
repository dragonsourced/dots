# .profile
#
# Loaded by the shell, probably.
# Who knows?

# Load dircolors

if [ -x /usr/bin/dircolors ]; then
    if [ -r ~/.dircolors ]; then
        eval "$(dircolors -b ~/.dircolors)"
    else
        eval "$(dircolors -b)"
    fi
fi

# Automatically show git status of a directory.

ls() {
    if [ "$*" ]; then
        git -C "$*" status -sb 2> /dev/null
    else
        git status -sb 2> /dev/null
    fi
    /bin/ls -shvp --group-directories-first --color=auto "$@"
}

__cdir() {
    pwd | sed "s|$HOME|~|"
}

__whoami() {
    printf '%s@%s' "$(whoami)" "$(hostname)"
}

PS1='$(__whoami) $(date +"%l:%M %p") $(__cdir) \$ '
export EDITOR=/usr/bin/nvim
export TERMINAL=/usr/local/bin/st
export BINDIR=${HOME}/bin

echo
printf '\e[1m'
cat ~/.notes 2> /dev/null
printf '\e[0m'
echo

# Use as many processes as possible for make, because I have no patience.

alias make='make -j$(nproc)'

# Path directories.

export PATH="$HOME/bin:$HOME/go/bin:$HOME/src/scripts:$PATH"
