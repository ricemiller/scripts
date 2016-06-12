#/bin/bash
# Randomly sets a new wallpaper extracted from a folder passed by arguments.
# nitrogen needed.
# DISPLAY may difer. Check with 'env | grep -i display' and set the variable with the result of the command.

if [[ $# -ne 1 ]]; then
    /bin/echo 'Usage: $0 /path/to/wallpapers/folder #no recursive'
    exit 1
else
    DIR=$1
    if [[ ! -d $DIR ]]; then
        /bin/echo "$1 should be a directory"
        exit 2
    fi
    LASTCHAR=$(tail -2c <<< $DIR)
    if [[ $LASTCHAR != "/" ]]; then
        DIR="$DIR/"
    fi
    IMAGE="$DIR/$(ls $DIR*.{jpg,png,jpeg} 2>/dev/null | sed 's#.*/##' | sort -R | sed 1q)"
    DISPLAY=:0  /usr/bin/nitrogen --set-zoom-fill --save $IMAGE
    exit 0
fi

