set autoindent
set shiftwidth=4
set columns=80

map gg 1G

map gs :!git status
map gd :!git diff %
map gl :!git log --oneline %
map gc :!git add % && git commit %
map gp :!git push
map gP :!git push &> /dev/null &

map M m_:%!fmt'_

map v o!!DISPLAY=:0 xsel -ob
map V O!!DISPLAY=:0 xsel -ob

map L :!lint %

ab vmain intmain(void){	return 0;}
ab #i #include

map q :e#
