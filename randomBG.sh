#/bin/bash
# Randomly sets a new wallpaper extracted from a folder passed by arguments.
# Now with recursive support!
# nitrogen needed.
# DISPLAY may difer. Check with 'env | grep -i display' and set the variable with the result of the command.

if [[ $# -ne 1 ]]; then
    /bin/echo 'Usage: $0 /full/path/to/wallpapers/folder'
    exit 1
else
    DIR=$1
    if [[ ! -d $DIR ]]; then
        /bin/echo "$1 should be a directory"
        exit 2
    fi
    LASTCHAR=$(tail -2c <<< $DIR)
    IMAGE="$(find $DIR -type f | grep '\|jpg\|png\|jpeg' | sort -R | sed 1q)"
    DISPLAY=:0  /usr/bin/nitrogen --set-zoom-fill --save $IMAGE
    exit 0
fi

