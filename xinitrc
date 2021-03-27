#!/bin/sh

pgrep -x xsettingsd || xsettingsd &

theme s purple

[ -f ~/.Xresources ] && xrdb ~/.Xresources
[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap

redshift &

_time() { date +'%T'; }
_date() { date +'%a %d/%m/%y'; }
_mori() { echo "† $(mori) †"; }
_vol() { amixer get Master | tr ' ' '\n' | grep % | tr -d '[]' | sed 1q; }
_bat() { acpi; }

_proc() {
	while true; do
		xsetroot -name " $(_bat) | $(_vol) | $(_mori) | $(_time) | $(_date) "
		sleep 1
	done
}

while true; do
	_proc &
	pid="$!"
	dwm
	kill "$pid"
done > ${HOME}/.log/dwm 2> ${HOME}/.log/dwm
