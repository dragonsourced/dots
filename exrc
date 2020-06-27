set autoindent
set shiftwidth=4
set columns=80

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

map M :%!fmtG$

map v o!!DISPLAY=:0 xsel -ob
map V O!!DISPLAY=:0 xsel -ob

map L :!lint %

ab #i #include
ab vmain intmain(void){
ab amain intmain(int argc, const char **argv){
