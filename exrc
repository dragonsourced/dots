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

map M :%!fmtG$

map v o!!DISPLAY=:0 xsel -ob
map V O!!DISPLAY=:0 xsel -ob

map L :!lint %

ab #i #include
ab vmain intmain(void){
ab amain intmain(int argc, const char **argv){
