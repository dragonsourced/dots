#!/bin/sh

compton -b

if [ -f /tmp/theme ]; then
	theme s "$(cat /tmp/theme)"
elif [ "$(date +%H)" -ge 18 ]; then
	theme s dark
else
	theme s light
fi

x-www-browser duolingo.com protonmail.com/login &

[ -f ~/.Xresources ] && xrdb ~/.Xresources
[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap

exec openbsd-cwm
