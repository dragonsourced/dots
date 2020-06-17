#!/bin/sh

compton -b

if [ -f /tmp/theme ]; then
	theme s "$(cat /tmp/theme)"
elif [ "$(date +%H)" -ge 18 ]; then
	theme s dark
else
	theme s light
fi

x-www-browser ttwebversion.com &

[ -f ~/.Xresources ] && xrdb ~/.Xresources

exec openbsd-cwm
