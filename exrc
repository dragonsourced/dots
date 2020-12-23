map gc :!git add % && git commit %
map gl :!git log --oneline %
map gL :!git log %
map gd :!git diff %
map gs :!git status
map gr :!git rebase -i
map gp :!git push

map ,c !!align c
map ,r !!align r
map ,l !!align l
map ,d !!date '+\%d \%b \%Y'

map M {!}fmt -w72 -g72
map L :!lint %
map K :!man 

map q :e#
map gg 1G
map v o!!DISPLAY=:0 xsel -ob
map V O!!DISPLAY=:0 xsel -ob

set wraplen=72
set autoindent

abbr -m &mdash;
abbr -n &endash;
