set autoindent
set shiftwidth=4

map gg 1G

map ]t 
map [t 
map q :e#

map gs :!git status
map gd :!git diff %
map gl :!git log --oneline %
map gL :!git log %
map gc :!git add % && git commit %
map ga :!git commit --amend %
map gp :!git push
map gP :!git push &> /dev/null &
map gn :!git notes add

map M :%!fmt -w72G$

map v o!!DISPLAY=:0 xsel -ob
map V O!!DISPLAY=:0 xsel -ob

map L :!lint %
