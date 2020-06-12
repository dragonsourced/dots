set autoindent
set shiftwidth=4
set columns=80

map gg 1G

map gs :!git status
map gd :!git diff %
map gl :!git log --oneline %
map gc :!git add % && git commit %
map gp :!git push
map gP :!git push &

map M :!make

ab vmain intmain(void){	return 0;}
ab #i #include

map q :e#
