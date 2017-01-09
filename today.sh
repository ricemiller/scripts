PARENT="${PWD##%/*}"
PAR_DIR=${PARENT##*/}
NOTE="${PAR_DIR}_$(date +%d_%m_%y).md"
vim $NOTE
exit 0
